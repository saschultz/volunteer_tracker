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
