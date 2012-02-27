require 'spec_helper'

describe "tweets/index" do
  fixtures :users, :tweets

  it "renders the compose section" do
    render
    assert_select "div.compose", :count => 1
  end

  it "renders the existing tweets" do
    render
    assert_select "div.tweets", :count => 1
  end

  it "renders a list of tweets" do
    render
    assert_select "div#latest_tweets", :count => 1 do
      assert_select "div.tweet", :count => 2 do
        assert_select "div.author" do
          assert_select "span.display_name"
          assert_select "span.handle"
        end
        assert_select "div.body"
      end
    end
  end
end
