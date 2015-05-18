class Cigar
  attr_reader :id, :errors
  attr_accessor :name

  def initialize(name = nil)
    self.name = name
  end

  def length(length = nil)
    self.length = length
  end

  def ring_gauge(ring_gauge = nil)
    self.ring_gauge = ring_gauge
  end

  def self.all
    Database.execute("select name from cigars order by name ASC").map do |row|
      cigar = Cigar.new
      cigar.name = row[0]
      cigar
    end
  end

  def self.count
    Database.execute("select count(id) from cigars")[0][0]
  end

  def valid?
    if name.nil? or name.empty? or /^\d+$/.match(name)
      @errors = "\"#{name}\" is not a valid scenario name."
      false
    else
      @errors = nil
      true
    end
  end

  def save_cigar
    return false unless valid?
    Database.execute("INSERT INTO cigars (name) VALUES (?)", name)
    Database.execute("INSERT INTO cigars (length) VALUES (?)", length)
    Database.execute("INSERT INTO cigars (ring_gauge) VALUES (?)", ring_guage)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end
end
