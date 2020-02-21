class SearchController < ApplicationController
  def index
    title = params[:title]
    conn = Faraday.new('http://openlibrary.org') do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/search.json?q=#{title}")
    result = JSON.parse(response.body, symbolize_names: true)
    result_title = result[:docs].first[:title]


  end
end