class Cigar
  attr_reader :id, :errors
  attr_accessor :maker, :name, :length, :ring_gauge

  def self.all
    Database.execute("select * from cigars").map do |row|
      cigar = Cigar.new
      cigar.maker      = row['maker']
      cigar.name       = row['name']
      cigar.length     = row['length']
      cigar.ring_gauge = row['ring_gauge']
      cigar.instance_vairable_set(:@id, row['id'])
      cigar
    end
  end

  def self.count
    Database.execute("SELECT COUNT(id) FROM cigars")[0][0]
  end

  def valid?
    if @maker.rstrip.empty?
      @errors = "\"#{maker}\" is unacceptable!"
      false
    elsif @name.rstrip.empty?
      @errors = "\"#{name}\" is unacceptable!"
      false
    elsif @length.rstrip.empty?
      @errors = "\"#{length}\" is unacceptable!"
      false
    elsif !@ring_gauge.class == Fixnum or @ring_gauge.to_i.zero?
      @errors = "\"#{ring_gauge}\" is unacceptable!"
      false
    else
      @errors = nil
      true
    end
  end

  def save
    return false unless valid?
    if @id.nil?
      Database.execute("INSERT INTO cigars (maker, name, length, ring_gauge) VALUES (?, ?, ?, ?)", maker, name, length, ring_gauge)
      @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
      true
    else
      Database.execute("UPDATE cigars SET maker = ?, name = ?, length = ?, ring_gauge = ? WHERE id = ?", maker, name, length, ring_gauge, id)
    end
  end
end
