require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :author_id => 1,
      :body => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path(@tweet), :method => "post" do
      assert_select "input[type='hidden']#tweet_author_id", :name => "tweet[author_id]"
      assert_select "textarea#tweet_body", :name => "tweet[body]"
    end
  end
end
