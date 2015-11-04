require 'sinatra'
require 'pry' if development?
require 'sinatra/reloader' if development?

enable(:sessions)

get "/" do
  if session[:login]
    "Welcome " +  session[:user]
  else
    "Logueate"
  end
  
end


get "/login" do
  erb(:login)
end


post "/login/check_login" do
  username = params[:user]
  password = params[:pass]
  if username == 'test' && password == '12345'
    session[:user] = username
    session[:login] = true
    redirect("/")
  else
    session[:login] = false
    redirect("/login")
  end
end

get "/session_test/:text" do
  text = params[:text]
  session[:saved_value] = text
  @show_session = session[:saved_value].gsub('_', ' ')


  erb(:session_test)
end


get "/session_show" do
  "Session show variable: " + session[:saved_value]
end

get "/logout" do
  session.clear
  redirect("/")
end