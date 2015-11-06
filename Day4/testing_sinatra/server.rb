require "sinatra"
require "sinatra/reloader" if development?

get "/" do

end

get "/real_page" do

end

get "/hi" do
  redirect("/real_page")
end