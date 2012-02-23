class User < ActiveRecord::Base
  has_secure_password

  has_many :tweets, :foreign_key => :author_id

  validates :email, :display_name, :password_confirmation, :presence => :true
  validates_uniqueness_of :email
end
