class BookResultsParser
  attr_reader :ol_results, :nyt_results

  def initialize(ol_results, nyt_results)
    @ol_results = ol_results
    @nyt_results = nyt_results
  end

  def title
    ol_results[:docs].first[:title]
  end

  def authors
    ol_results[:docs].first[:author_name]
  end

  def genres
    ol_results[:docs].first[:seed].map do |result|
      result.split('/')[2] if result.split('/')[1] == 'subjects'
    end
  end

  def summaries
    nyt_results[:results].map do |result|
      result[:summary]
    end
  end

  def final
    {
      title: title,

      authors: authors,

      genres: genres,

      summaries: summaries
    }
  end
end