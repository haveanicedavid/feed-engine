desc "This task is called by the Heroku scheduler add-on"
task :run_saved_searches => :environment do
  puts "Analyzing searches..."
  Search.run_saved_searches
  puts "done."
end
