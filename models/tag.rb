require './data_mapper_setup'
require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :links, through: Resource

end
