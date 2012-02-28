require 'spec_helper'

describe User do
  describe "validation"
    def valid_attributes
        {
          :email                 => 'e@mail.com',
          :display_name          => 'Valid User',
          :handle                => 'handle',
          :password              => 'secret',
          :password_confirmation => 'secret'
        }
      end
  
      it "should be invalid if email is missing" do
        user = User.new valid_attributes
        user.email = ''
  
        user.should_not be_valid
        user.should have(2).errors_on(:email)
      end
  
      it "should be invalid if the email format is not valid" do
        user = User.new valid_attributes
        user.email = 'this is not valid'
  
        user.should_not be_valid
        user.should have(1).errors_on(:email)
      end
  
      it "should be invalid if the email is not unique" do
        User.create valid_attributes
        user = User.new valid_attributes
  
        user.should_not be_valid
        user.should have(1).errors_on(:email)
      end
  
      it "should be invalid if display_name is missing" do
        user = User.new valid_attributes
        user.display_name = ''
  
        user.should_not be_valid
        user.should have(1).errors_on(:display_name)
      end
  
      it "should be invalid if handle is missing" do
        user = User.new valid_attributes
        user.handle = ''
  
        user.should_not be_valid
        user.should have(2).errors_on(:handle)
      end
  
      it "should be invalid if handle format is not valid" do
        user = User.new valid_attributes
        user.handle = 'this is not valid'
  
        user.should_not be_valid
        user.should have(1).errors_on(:handle)
      end
  
      it "should be invalid if the handle is not unique" do
        User.create valid_attributes
        user = User.new valid_attributes
  
        user.should_not be_valid
        user.should have(1).errors_on(:handle)
      end
  
      it "should be invalid if password is missing" do
        user = User.new valid_attributes
        user.password = ''
  
        user.should_not be_valid
        user.should have(1).errors_on(:password)
      end
  
      it "should be invalid if password_confirmation is missing" do
        user = User.new valid_attributes
        user.password_confirmation = ''
  
      user.should_not be_valid
      user.should have(1).errors_on(:password_confirmation)
    end
  end

  describe "attribute formatters" do
    fixtures :users

    it "should format a correct handle" do
      user = users(:author)
      user.display_handle.should == ('@' + user.handle)
    end
  end

  describe "relationships" do
    fixtures :users, :follows
    
    it "should identify a followed user" do
      user = users(:author)
      followed_user = users(:followed_user)

      user.followed_users.find(followed_user.id).should == followed_user
    end
end
