class Book
  attr_reader :title, :authors, :genres, :summaries

  def initialize(data)
    @title = data[:title]
    @authors = data[:authors]
    @genres = data[:genres]
    @summaries = data[:summaries]
  end
end