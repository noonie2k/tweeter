require 'spec_helper'

describe User do
  def valid_attributes
    {
      :email                 => 'e@mail.com',
      :display_name          => 'Valid User',
      :password              => 'secret',
      :password_confirmation => 'secret'
    }
  end

  it "should be invalid if email is missing" do
    user = User.new valid_attributes
    user.email = ''

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
