require "capybara/dsl"
require "capybara/poltergeist"
require 'benchmark'
require 'typhoeus'
require 'typhoeus/adapters/faraday'


total_time_taken = 0
pages_tested = 0
failures = []


namespace :pig do
  task smoke: :environment do
    hydra = Typhoeus::Hydra.new(max_concurrency: 10)
    links_to_test = Pig::Permalink.active
    requests = links_to_test.map do |permalink|
      next if permalink.resource.nil? || permalink.resource.viewless?
      request = Typhoeus::Request.new("http://0.0.0.0:8080#{permalink.full_path}", followlocation: true)

      request.on_complete do |response|
        pages_tested += 1
        success = response.return_code == :ok && !response.body.include?('Pig::') && !(response.body =~ /href="\/\d+"/)

        failures << permalink unless success
        total_time_taken += response.total_time
        puts "#{pages_tested}/#{links_to_test.count} - #{success ? 'SUCCESS' : 'FAILURE'} for #{permalink.full_path} in #{response.total_time} seconds"
      end

      hydra.queue(request)
      request
    end
    hydra.run


    puts '-------'
    puts "RESULTS"
    puts '-------'
    puts "#{pages_tested} pages tested in #{total_time_taken}"
    puts "#{failures.count} failed pages:"
    failures.each do |permalink|
      puts permalink.full_path
    end
  end

  task getting_old_emails: :environment do
    Pig::ContentPackage.where(next_review: Time.zone.today)
      .group_by(&:requested_by)
      .each do |user, content_packages|
        Pig::ContentPackageMailer.getting_old(user, content_packages).deliver_now
      end
  end

  namespace :db do
    task seed: :environment do
      Pig::Engine.load_seed
    end
  end
end
