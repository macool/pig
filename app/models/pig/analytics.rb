module Pig
  class Analytics

    attr_reader :referrers

    def initialize(results)
      @referrers = results.group_by(&:source).map { |x| Referrer.new(x) }
      @totals = results.totals_for_all_results
    end

    def as_json(options={})
      {
        total: @totals['pageviews'],
        referrers: @referrers,
        avg_time_on_page: @totals['avgTimeOnPage'].to_i
      }
    end

  end

  class Referrer
    def initialize(referrer)
      @name = referrer[0]
      @keywords = referrer[1].map { |x| Keyword.new(x) }
    end

    def total
      @keywords.collect(&:total).sum
    end

    def as_json(options={})
      {
        name: @name,
        total: total,
        keywords: @keywords
      }
    end

  end

  class Keyword

    attr_reader :word, :total

    def initialize(keyword)
      @word = keyword.keyword
      @total = keyword.pageviews.to_i
    end

    def as_json(options={})
      {
        total: @total,
        word: @word
      }
    end
  end

end
