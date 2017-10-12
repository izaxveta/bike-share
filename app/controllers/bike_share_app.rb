require 'will_paginate'
require 'will_paginate/active_record'

require_relative '../models/station.rb'
require_relative 'rest_url'

class BikeShareApp < Sinatra::Base
  configure do
    register WillPaginate::Sinatra
  end
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  helpers RestUrl

  def sub_erb(view)
    erb :"layouts/#{view}" do
      erb :"#{@model.name}/#{view}"
    end
  end

  get '/' do
    erb :home
  end

  get '/stations' do
    @model = Station
    @records = Station.paginate(page: params[:page], per_page: 30)
    sub_erb :index
  end

  get '/stations/new' do
    @model = Station
    sub_erb :new
  end

  get '/stations/:id' do |id|
    @model = Station
    @id = id
    @record = Station.find(id)
    sub_erb :show
  end

  get '/station-dashboard' do
    @model = Station
    @records = Station.all
    sub_erb :dashboard
  end

  get '/stations/:id/edit' do |id|
    @model = Station
    @id = id
    @record = Station.find(id)
    sub_erb :edit
  end

  post '/stations' do
    @model = Station
    id = Station.create(params[:station]).id
    redirect to "/stations/#{id}"
  end

  put '/stations/:id' do |id|
    @model = Station
    @id = id
    Station.update(id.to_i, params[:station])
    redirect to "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    @model = Station
    @id = id
    Station.destroy(id.to_i)
    redirect to '/stations'
  end

  get '/trip-dashboard' do
    @model = Trip
    @records = Trip.all
    sub_erb :dashboard
  end

  get '/trips' do
    @model = Trip
    @records = Trip.paginate(page: params[:page], per_page: 30)
    sub_erb :index
  end

  get '/trips/new' do
    @model = Trip
    @stations = Station.all
    sub_erb :new
  end

  get '/trips/:id' do |id|
    if !Trip.exists?(id)
      erb :not_found
    else
      @model = Trip
      @id = id
      @record = Trip.find(id)
      sub_erb :show
    end
  end

  get '/trips/:id/edit' do |id|
    @model = Trip
    @id = id
    @record = Trip.find(id)
    @stations = Station.all
    sub_erb :edit
  end

  post '/trips' do
    id = Trip.create!(params[:trip]).id
    redirect to "/trips/#{id}"
  end

  put '/trips/:id' do |id|
    Trip.update!(id.to_i, params[:trip])
    redirect to "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy!(id.to_i)
    redirect to '/trips'
  end

  get '/conditions' do
    @model = Condition
    @records = Condition.paginate(page: params[:page], per_page: 30)
    sub_erb :index
  end

  get '/conditions/new' do
    @model = Condition
    sub_erb :new
  end

  get '/conditions/:id' do |id|
    @model = Condition
    @id = id
    @record = Condition.find(id)
    sub_erb :show
  end

  get '/weather-dashboard' do
    @model = Condition
    @records = Condition.all
    sub_erb :dashboard
  end

  get '/conditions/:id/edit' do |id|
    @model = Condition
    @id = id
    @record = Condition.find(id)
    sub_erb :edit
  end

  post '/conditions' do
    @model = Condition
    id = Condition.create(params[:station]).id
    redirect to "/conditions/#{id}"
  end

  put '/conditions/:id' do |id|
    @model = Condition
    @id = id
    Condition.update(id.to_i, params[:station])
    redirect to "/conditions/#{id}"
  end

  delete '/conditions/:id' do |id|
    @model = Condition
    @id = id
    Condition.destroy(id.to_i)
    redirect to '/stations'
  end

  not_found do
    erb :not_found
  end
end
