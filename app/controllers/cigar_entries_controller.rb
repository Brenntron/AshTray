class CigarEntriesController
  def index
    say("Your ash tray contains...\n\n")
    CigarEntries.all.each do |cigar|
      say("#{cigar_entry.rating}")
    end
  end
end
