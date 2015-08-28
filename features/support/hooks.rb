Before('@non-nested') do
  Pig.configuration.nested_permalinks = false
end

Before('@nested') do
  Pig.configuration.nested_permalinks = true
end

After do |scenario|
  # save_and_open_page if scenario.failed?
  Cucumber.wants_to_quit = true if scenario.failed?
end
