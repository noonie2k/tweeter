require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "MyString",
      :display_name => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_display_name", :name => "user[display_name]"
      assert_select "input#user_handle", :name => "user[handle]"
      assert_select "input[type='password']#user_password", :name => "user[password]"
      assert_select "input[type='password']#user_password_confirmation", :name => "user[password_confirmation]"
    end
  end
end
