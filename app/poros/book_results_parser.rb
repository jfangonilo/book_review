class BookResultsParser
  attr_reader :ol_results, :nyt_results

  def initialize(ol_results, nyt_results)
    @ol_results = ol_results
    @nyt_results = nyt_results
  end

  def final
    {
      title: ol_results[:docs].first[:title],

      authors: ol_results[:docs].first[:author_name],

      genres: ol_results[:docs].first[:seed].map do |result|
        result.split('/')[2] if result.split('/')[1] == 'subjects'
      end,

      summaries: nyt_results[:results].map do |result|
        result[:summary]
      end
    }
  end
end