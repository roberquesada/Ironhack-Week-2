require_relative '../server.rb'
require "rspec"
require "rack/test"

describe "Server Service" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Should load the home page" do
    get '/'
    expect(last_response).to be_ok
  end


  it "Should load the lasted posts" do
    get '/latest_posts'
    expect(last_response).to be_ok
  end

  it "Should load the lasted posts" do
    get '/post_details/:id'
    expect(last_response).to be_ok
  end

end