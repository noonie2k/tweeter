require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :display_name => "Display Name",
        :handle => "handle"
      ),
      stub_model(User,
        :email => "Email",
        :display_name => "Display Name",
        :handle => "handle"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
    assert_select "tr>td", :text => "handle".to_s, :count => 2
  end
end
