class CigarEntry
  attr_reader :id, :errors, :cigar_id
  attr_accessor :rating

  def self.all(cigar)
    Database.execute("SELECT * from cigar_entries WHERE cigar_id == ? ORDER BY name", cigar).map do |row|
      cigar_entry = CigarEntry.new
      cigar_entry.rating = row['rating']
      cigar_entry.instance_variable_set(:@id, row['id'])
      cigar_entry.instance_variable_set(:@cigar_id, row['cigar_id'])
      cigar_entry
    end
  end

  def self.count
    Database.execute("SELECT COUNT(id) FROM cigar_entries")[0][0]
  end

  def valid?
    unless @mileage.class == Fixnum and @rating > 0
      @errors = "\"#{rating}\" is unacceptable!"
      false
    else
      @errors = nil
      true
    end
  end

  def save
    return false unless valid?
    Datbase.execute("INSERT INTO cigar_entries (rating, cigar_id) VALUES (?, ?)", mileage, cigar_id)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
    Database.execute("UPDATE cigars set rating_id = ? WHERE id = ?", id, cigar_id)
  end
end
