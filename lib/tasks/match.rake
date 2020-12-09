namespace :match do
  desc "Fetches data from sportsdb.com"
  task populate: :environment do
    LatestGamesJob.perform_now
  end

end
