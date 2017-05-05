require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/project'
require './lib/volunteer'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get '/' do
  @projects = Project.all
  erb :index
end

post '/add_project' do
  name = params.fetch('name')
  Project.new({:name => name}).save
  @projects = Project.all
  erb :index
end

get '/project/:id' do
  @project = Project.find(params.fetch("id").to_i)

  erb :project_interface
end

patch '/project/:id/edit' do
  @project = Project.find(params.fetch("id").to_i)
  name = params.fetch('name')

  if (name.split('').any?)
    @project.update({:name => name})
  else
    @project.update({:name => "#{@project.name}"})
  end
  erb :project_interface
end
