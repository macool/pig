require "capybara/dsl"
require "capybara/poltergeist"
require 'benchmark'

total_time_taken = 0
pages_tested = 0
failures = 0


class Screenshot
  include Capybara::DSL

  # Captures a screenshot of +url+ saving it to +path+.
  def capture(url, path)
    visit url
    return page.driver.status_code == 200
  end
end

namespace :pig do
  task smoke: :environment do
    Capybara.run_server = false
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end
    Capybara.current_driver = :poltergeist

    Pig::Permalink.active.each do |permalink|
      pages_tested += 1
      screenshot = Screenshot.new
      puts "Screenshotting #{permalink.full_path}"
      time_taken = Benchmark.realtime do
        success = screenshot.capture "http://0.0.0.0:3000#{permalink.full_path}", "#{permalink.full_path}.png"
        unless success
          puts "FAILED for #{permalink.full_path}"
          failures +=1
        end
      end
      total_time_taken += time_taken
      puts "Finished in #{time_taken}"
    end

    puts "TOTAL TIME TAKEN #{total_time_taken}"
    puts "PAGES TESTED: #{pages_tested}"
    puts "FAILED PAGES: #{failures}"
  end
end
