class Post

  attr_reader :title, :text, :date

  def initialize title, text, date
    @title = title
    @text = text
    @date = date
  end

end