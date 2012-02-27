require 'spec_helper'

describe "tweets/show" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :author_id => 1,
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
  end
end
