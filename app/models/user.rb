class User < ActiveRecord::Base
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "#{id}. #{name} #{email} #{password}"
  end
end
