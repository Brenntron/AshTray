require 'sqlite3'

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS cigars (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(255) NOT NULL,
      ring_gauge integer NOT NULL,
      length varchar(255) NOT NULL,
      maker varchar(255) NOT NULL,
      rating_id integer NOT NULL,
      FOREIGN KEY(rating_id) REFERENCES cigar_entries(id)
    );
    SQL
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS cigar_entries (
      id integer PRIMARY KEY AUTOINCREMENT,
      rating integer NOT NULL,
      cigar_id integer NOT NULL,
      FOREIGN KEY(cigar_id) REFERENCES cigars(id)
    );
    SQL
  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = ENV["TEST"] ? "test" : "production"
    database = "db/ash_tray_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    @@db.results_as_hash = true
  end
end
