require "sinatra"



get "/" do
  redirect "http://google.com"
end

get "/about" do
  @name = "Roberto"
  erb(:author)
end

get "/time" do
  erb(:time)
end

get "/pizza" do
  @ingredients = ['peperoni', 'cheese', 'tomato']
  erb(:pizza)
end


get "/users/:username" do
  @username = params[:username]

  erb(:user_profile)
end

get "/hours/ago/:hour" do
  hour = params[:hour]
  @time = Time.now - (3600)*hour.to_i
  @time = @time.strftime('%H:%M:%S')

  erb(:hours)
end