class SearchController < ApplicationController
  def index
    title = params[:title]

    ol_service = OpenLibraryService.new(title)
    result = ol_service.result
    result_title = result[:docs].first[:title]
    result_authors = result[:docs].first[:author_name]
    result_genres = result[:docs].first[:seed]
    parsed_genres = result_genres.map do |result|
      result.split('/')[2] if result.split('/')[1] == 'subjects'
    end


    nyt_service = NytService.new(result_title)
    nyt_result = nyt_service.nyt_result
    result_summary = nyt_result[:results].map do |result|
      result[:summary]
    end

    book_hash = {
      title: result_title,
      authors: result_authors,
      genres: parsed_genres,
      summaries: result_summary
    }
    @book = Book.new(book_hash)
  end
end