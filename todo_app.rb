$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'

require 'models/todo'


# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

get '/' do
  @tester = Todo.all

  p @tester.name
  erb :index
end

post '/todos' do
  p params[:name]
  Todo.create(params)

  # todo_item.name = params[:name]
  # @tester = todo_item.name
  redirect '/'
end

p @tester


