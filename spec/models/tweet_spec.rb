require 'spec_helper'

describe Tweet do
  def valid_attributes
    {
      :author_id => 1,
      :body => 'This is a tweet'
    }
  end

  it "should be invalid if the body is missing" do
    tweet = Tweet.new valid_attributes
    tweet.body = ''

    tweet.should_not be_valid
    tweet.should have(1).errors_on(:body)
  end
end
