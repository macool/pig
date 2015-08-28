class Visits
  extend Legato::Model

  metrics :pageviews, :avg_time_on_page
  dimensions :page_path, :referral_path, :full_referrer, :source, :keyword

  filter :page_path, &lambda { |page_path| eql(:page_path, page_path) }
end
