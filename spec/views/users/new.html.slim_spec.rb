require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :email => "MyString",
      :display_name => "MyString",
      :password_digest => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_display_name", :name => "user[display_name]"
      assert_select "input#user_handle", :name => "user[handle]"
      assert_select "input[type='password']#user_password", :name => "user[password]"
      assert_select "input[type='password']#user_password_confirmation", :name => "user[password_confirmation]"
    end
  end
end
