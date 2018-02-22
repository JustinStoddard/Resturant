ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require 'sinatra'
require 'rubygems'
require 'sinatra/activerecord'
require './environments'
require_relative 'routes'
require './models/app'

class Menus < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "views") }
    enable :sessions
    register Sinatra::ActiveRecordExtension
    use Rack::MethodOverride

    get '/' do
        'Hello World!'
    end
end
