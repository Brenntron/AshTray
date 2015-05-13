require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'
class Minitest::Test
  def setup
    Database.load_structure
    Database.execute("DELETE FROM cigars;")
  end
end

def create_cigar(name)
  Database.execute("INSERT INTO cigars (name) VALUES (?)", name)
end

def main_menu
  "1. Add a cigar\n2. List all scenarios\n3. Exit\n"
end
