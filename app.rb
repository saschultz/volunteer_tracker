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
  @volunteers =  DB.exec("SELECT name FROM volunteers WHERE project_id = #{params.fetch("id").to_i};")
  erb :project_interface
end

post '/project/:id/volunteer' do
  volunteer_name = params.fetch('volunteer_name')
  project_id = params.fetch('project_id').to_i
  id = nil
  @volunteer = Volunteer.new({:name => volunteer_name, :id => nil, :project_id => project_id}).save
  @project = Project.find(project_id)
  @volunteers = Volunteer.all
  erb :project_interface
end

get '/volunteer/:id' do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  erb :volunteer
end

patch '/volunteer/:id' do
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  volunteer_name = params.fetch('volunteer_name')
  if (volunteer_name.split('').any?)
    @volunteer.update({:name => volunteer_name})
  else
    @volunteer.update({:name => "#{@volunteer.name}"})
  end
  @volunteers = DB.exec("SELECT name FROM volunteers where project_id = #{params.fetch('id').to_i};")
  erb :volunteer
end

patch '/project/:id/edit' do
  @project = Project.find(params.fetch("id").to_i)
  name = params.fetch('name')
  if (name.split('').any?)
    @project.update({:name => name})
  else
    @project.update({:name => "#{@project.name}"})
  end
  @volunteers =  DB.exec("SELECT name FROM volunteers WHERE project_id = #{params.fetch("id").to_i};")
  erb :project_interface
end

delete '/project/:id/edit' do
  project = Project.find(params.fetch("id").to_i)
  project.delete
  @projects = Project.all
  erb :index
end

delete '/volunteer/:id' do
  volunteer = Volunteer.find(params.fetch("id").to_i)
  volunteer.delete
  @volunteers = Volunteer.all
  @projects = Project.all
  erb :index
end
