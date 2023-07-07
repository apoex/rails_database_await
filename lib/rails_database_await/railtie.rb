require "rails_database_await"
require "rails"

module RailsDatabaseAwait
  class Railtie < Rails::Railtie
    railtie_name :rails_database_await

    rake_tasks do
      path = File.expand_path(__dir__)
      load "#{path}/tasks/db/await.rake"
    end
  end
end
