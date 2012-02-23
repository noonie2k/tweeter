require 'spec_helper'

describe "sessions/new" do
  it "renders login form" do
  	render

  	assert_select "form", :action => login_path, :method => :post do
      assert_select "input#email", :name => "user[email]"
      assert_select "input[type='password']#password", :name => "user[password]"
      assert_select "input[type='submit']"
      assert_select 'a#register'
    end
  end
end
