class User < ActiveRecord::Base
  has_secure_password

  has_many :tweets, :foreign_key => :author_id
  has_many :follows
  has_many :followed_users, :through => :follows

  validates :email, :display_name, :handle, :password_confirmation,
    :presence => :true

  validates :email, :format => { :with => /^[\_]*([a-z0-9]+(\.|\_*)?)+@([a-z][a-z0-9\-]+(\.|\-*\.))+[a-z]{2,6}$/ }

  validates :handle, :format => { 
    :with => /^[a-z0-9_-]+$/,
    :message => 'should contain only letters, numbers, hyphens and underscores'
  }
    
  validates :email, :handle,
    :uniqueness => :true

  def display_handle
    '@' + handle
  end
end
