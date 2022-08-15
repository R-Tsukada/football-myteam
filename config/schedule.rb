every 1.day, at: '5am' do
  update_standings = API::UpdateStandingsController.new
  runner "update_standings.api_request"
  update_matches = API::UpdateMatchesController.new
  runner "update_matches.api_request"
end
