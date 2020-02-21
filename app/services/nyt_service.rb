class NytService
  attr_reader :book_title

  def initialize(book_title)
    @book_title = book_title
  end

  def nyt_result
    nyt_resp = conn.get("/svc/books/v3/reviews.json?api-key=#{ENV['NY_TIMES_API_KEY']}&title=#{book_title}")
    nyt_result = JSON.parse(nyt_resp.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.nytimes.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end