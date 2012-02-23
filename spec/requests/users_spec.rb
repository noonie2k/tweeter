require 'spec_helper'

describe "Users" do
  describe "GET /users" do
  	it "should redirect to the login page when user is logged out" do
  		get users_path
  		response.should redirect_to login_path
  	end
  end
end