class CigarEntry
  attr_reader :id, :errors, :cigar_id
  attr_accessor :rating

  def self.all
    Database.execute("SELECT * from cigar_entries").map do |row|
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
    unless @rating.class == Fixnum and @rating > 0
      @errors = "\"#{rating}\" is the worst unacceptable!"
      false
    else
      @errors = nil
      true
    end
  end

  def save
    return false unless valid?
    Database.execute("INSERT INTO cigar_entries (rating, cigar_id) VALUES (?, ?)", rating, cigar_id)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
    Database.execute("UPDATE cigars set rating_id = ? WHERE id = ?", id, cigar_id)
  end
end
