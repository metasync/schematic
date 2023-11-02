# frozen-string-literal: true

namespace :env do
  desc "Load environment settings"
  task :load do
    require "dotenv"
    Dotenv.load(*Dir["#{ENV['ENV_HOME']}/**/*.env"])
  end
end
