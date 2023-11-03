# frozen-string-literal: true

namespace :app do
  desc "Load environment settings"
  task :env do
    require "dotenv"
    Dotenv.load(*Dir["#{ENV['ENV_HOME']}/**/*.env"])
  end
  
  desc "Show application version"
  task :version do
    if ENV['APP_VERSION'].nil?
      puts File.read('VERSION') if File.exist?('VERSION')
    else
      puts ENV['APP_VERSION']
    end
  end
end

namespace :schematic do
  desc "Show Schematic version"
  task :version do
    puts ENV['SCHEMATIC_VERSION'] 
  end
end
