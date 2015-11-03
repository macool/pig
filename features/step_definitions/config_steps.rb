Given(/^the config is setup to only allow permalink to be deleted for (\d+) hour$/) do |n|
  Pig.configuration.can_delete_permalink = proc { |permalink| permalink.created_at > n.to_i.hours.ago }
end
