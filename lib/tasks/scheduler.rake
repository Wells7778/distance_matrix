desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  List.where("created_at < ?", Time.now - 15*24*60*60 ).destroy_all
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end