MAX_TRIES = ENV.fetch("DATABASE_AWAIT_MAX_TRIES", 30).to_i
WAIT_TIME = ENV.fetch("DATABASE_AWAIT_WAIT_TIME", 1).to_i

namespace :db do
  task await: :environment do
    tries ||= 0
    tries += 1

    ActiveRecord::Base.connection
    puts "Database available"
  rescue PG::ConnectionBad, ActiveRecord::ConnectionNotEstablished
    if tries >= MAX_TRIES
      puts "#{MAX_TRIES} tries exceeded, exiting"
      exit 1
    end

    puts "Database unavailable, waiting #{WAIT_TIME} second. #{MAX_TRIES - tries} tries left."

    sleep WAIT_TIME
    retry
  end
end
