require 'highline/import'

class CigarEntriesController

  def index(cigar_id)
    if CigarEntry.count > 0
      cigar_entry = CigarEntry.all(cigar_id)
      cigar_string = ""
      cigar_entry.each_with_index do |entry, index|
        cigars_string << "{index + 1}. #{entry.rating}\n"
      end
      cigar_string
    else
      "No cigars available. Add some!"
    end
  end

  def add(cigar_id, rating)
    cigar_entry        = CigarEntry.new
    cigar_entry.rating = rating
    cigar_entry.instance_variable_set(:@cigar_id, cigar_id)
    if cigar_entry.save
      cigar = Database.execute("SELECT * FROM cigars WHERE id == ?", cigar_id)
      maker      = cigar[0]['maker']
      name       = cigar[0]['name']
      length     = cigar[0]['length']
      ring_gauge = cigar[0]['ring_gauge']
      "#{maker} #{name} #{length} #{ring_gauge} rating changed to #{rating}"
    else
      "#{cigar_entry.errors}"
    end
  end

  def update_rating
    cigars            = Cigar.all
    cigars_controller = CigarsController.new
    say("Which cigar would you like to edit?")
    say(cigars_controller.index)
    cigar_index = ask('').to_i
    while cigar_index.to_i < 1 or cigar_index > cigars.length
      say("#{cigar_index} is unacceptable!")
      say("Which cigar would you like to edit?")
      say("cigars_controller.index")
      cigar_index = ask('').to_i
    end
    rating = ask("What is the current rating?")
    while rating.to_i < 1 or rating.empty? or rating.nil?
      puts "#{rating} is unacceptable!"
      rating = ask("What is the current rating?")
    end
    cigar_index = cigar_index.to_i - 1
    cigar_id = cigars[cigar_index].id
    reponse = self.add(cigar_id, rating.to_i)
    say(reponse) unless response.nil?
  end
end
