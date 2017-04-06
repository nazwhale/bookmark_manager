ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require 'data_mapper'
require_relative './data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'

class Bookmark < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:name])
    params[:tags].split(",").each do |tag|
      link.tags << Tag.first_or_create(name: tag.strip)
    end
    link.save
    redirect '/links'
  end

  post '/tags' do
    tag = Tag.first(name: params[:filter])
    $links = tag ? tag.links : []
    redirect '/tags/tag_filter'
  end

  get '/tags/tag_filter' do
    @links = $links
    erb(:links)
  end
end
