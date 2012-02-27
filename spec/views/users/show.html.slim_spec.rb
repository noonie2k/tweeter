require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :display_name => "Display Name",
      :handle => "Handle"
    ))
  end

  it "shows user information" do
    render
    assert_select "div#user", :count => 1 do
      assert_select "div.email", :count => 1, :text => @user.email
      assert_select "div.display_name", :count => 1, :text => @user.display_name
      assert_select "div.handle", :count => 1, :text => @user.handle
    end
  end

  it "allows me to follow the user" do
    render
    assert_select "div#follow" do
      assert_select "input[type='submit']", :value => 'Follow'
    end
  end

  it "shows user's tweets" do
    render
    assert_select "div#tweets", :count => 1
  end
end
