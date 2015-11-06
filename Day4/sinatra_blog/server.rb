require "sinatra"
require 'sinatra/reloader' if development?
require "pry"

require_relative "./lib/blog.rb"

blog = Blog.new
blog.add_post Post.new('Title1', 'Content1', Time.now().strftime("%Y-%m-%d %H:%M:%S"))
blog.add_post Post.new('Old post', 'This is a old post', "2015-10-06 22:42:33")
blog.add_post Post.new('Title2', 'Content2', Time.now().strftime("%Y-%m-%d %H:%M:%S"))
blog.add_post Post.new('Title3', 'Content3', Time.now().strftime("%Y-%m-%d %H:%M:%S"))

get "/" do
  @posts = blog.posts
  erb(:home)
end

get "/latest_posts" do
  @posts = blog.latest_posts
  erb(:latest_posts)
end