require 'sqlite3'

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS scenarios (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(255) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    intialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = ENV["TEST"] ? "test" : "production"
    database    = "db/ash_tray_#{environment}.sqlite"
    @@db        = SQlite3::Database.new(database)
  end
end
