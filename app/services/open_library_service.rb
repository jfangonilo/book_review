class OpenLibraryService
  attr_reader :book_title

  def initialize(book_title)
    @book_title = book_title
  end

  def result
    response = conn.get("/search.json?q=#{book_title}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end