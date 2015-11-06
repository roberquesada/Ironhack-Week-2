require_relative "../lib/blog.rb"

describe Blog do

  let(:post) { Post.new( 'Title', 'Content', Time.now().strftime("%Y-%m-%d %H:%M:%S")) }
  let(:post2) { Post.new( 'Title', 'Content', Time.now().strftime("%Y-%m-%d %H:%M:%S")) }
  let(:post3) { Post.new( 'Title', 'Content', "2015-09-11 00:05:00") }
  let(:post4) { Post.new( 'Title', 'Content', "2015-06-11 00:05:00") }
  let(:blog) { Blog.new }

  describe "#add_post" do
    it "If input is empty return a empty array" do
      expect(blog.add_post('')).to eq([''])
    end

    it "Return an array with one object" do
      expect(blog.add_post(post)).to eq([post])
    end

    it "Return an array with two object" do
      blog.add_post(post)
      expect(blog.add_post(post2)).to eq([post, post2])
    end
  end

  describe "#lastes_posts" do
    it "If input is empty return a empty array" do
      expect(blog.latest_posts).to eq([])
    end

    it "Return an ordered array by more new with one object" do
      blog.add_post(post)
      expect(blog.latest_posts).to eq([post])
    end

    it "Return an ordered array by more new with 3 object" do
      blog.add_post(post4)
      blog.add_post(post)
      blog.add_post(post3)
      expect(blog.latest_posts).to eq([post, post3, post4])
    end
  end

end