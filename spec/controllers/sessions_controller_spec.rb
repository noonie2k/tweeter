require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    before(:each) do
      @user = User.create!(
        :email                 => 'e@mail.com',
        :display_name          => 'Test User',
        :password              => 'secret',
        :password_confirmation => 'secret'
      )
    end

    it "redirects to root if the login was successful" do
      get 'create', :email => @user.email, :password => @user.password

      session.should include(:user_id)
      response.should redirect_to(root_path)
    end

    it "redirects to login if the password was bad" do
      get 'create', :email => @user.email, :password => 'incorrect'

      session.should_not include(:user_id)
      response.should redirect_to(login_path)
    end

    it "redirects to login if the user does not exist" do
      get 'create', :email => 'does@not.exist', :password => 'whatever'

      session.should_not include(:user_id)
      response.should redirect_to(login_path)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      
      session.should_not include(:user_id)
      response.should redirect_to(root_path)
    end
  end
end
