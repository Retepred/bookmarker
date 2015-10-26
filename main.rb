require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

require_relative 'models/db_base'
require_relative 'models/bookmark'
require_relative 'controllers/bookmarks_controller'

get '/' do
  erb :home
end