class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed_user, :class_name => 'User', :foreign_key => 'followed_user_id'
end
