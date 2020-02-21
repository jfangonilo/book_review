class SearchController < ApplicationController
  def index
    title = params[:title]

    ol_service = OpenLibraryService.new(title)
    result = ol_service.result
    result_title = result[:docs].first[:title]

    nyt_service = NytService.new(result_title)
    nyt_result = nyt_service.nyt_result

    book_hash = BookResultsParser.new(result, nyt_result).final

    @book = Book.new(book_hash)
  end
end