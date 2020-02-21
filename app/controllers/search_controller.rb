class SearchController < ApplicationController
  def index
    title = params[:title]
    conn = Faraday.new('http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/search.json?q=#{title}")
    result = JSON.parse(response.body, symbolize_names: true)
    result_title = result[:docs].first[:title]

    nyt_conn = Faraday.new('https://api.nytimes.com') do |f|
      f.adapter Faraday.default_adapter
    end
    nyt_resp = nyt_conn.get("/svc/books/v3/reviews.json?api-key=#{ENV['NY_TIMES_API_KEY']}&title=#{result_title}")
    nyt_result = JSON.parse(nyt_resp.body, symbolize_names: true)
    result_summary = nyt_result[:results].first[:summary]
  end
end