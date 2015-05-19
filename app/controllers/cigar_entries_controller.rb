class CigarEntriesController
  def index
    say("Your ash tray contains...\n\n")
    CigarEntries.all.each do |entry|
      say("#{entry.rating}")
    end
  end
end
