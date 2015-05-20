class CigarEntry
  attr_reader :id, :errors

  def initialize(rating)
    @rating = rating
  end

  def self.all
    Database.execute("select * from cigar_entries").map do |row|
      cigar_entry = CigarEntry.new
    end
  end
end
