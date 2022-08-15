# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every :sunday, at: '11:40 am' do # Use any day of the week or :weekend, :weekday
  update_mateches = UpdateMatches.new
  update_standings = UpdateStandings.new
  runner "update_mateches.set_match"
  runner "update_standings.api_request"
end
