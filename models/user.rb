require './data_mapper_setup'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
