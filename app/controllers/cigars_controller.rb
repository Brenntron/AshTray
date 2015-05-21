require "highline/import"

class CigarsController
  def index
    if Cigar.count > 0
      cigars        = Cigar.all
      cigars_string = ""
      cigars.each_with_index do |cigar, index|
        cigars_string << "#{index + 1}. #{cigar.maker} #{cigar.name} #{cigar.length}\n"
      end
      cigars_string
    else
      "No cigars found. Add a cigar.\n"
    end
  end

  def return_info
    info_string = ""
    Database.execute("SELECT maker, name, length, ring_gauge, rating FROM cigars INNER JOIN cigar_entries WHERE cigars.rating_id == cigar_entries.id").map do |row|
      index  = 0
      index += 1
      info_string << "#{index} #{row['maker']} #{row['name']} #{row['length']} #{row['ring_gauge']} #{row['rating']}"
    end
    info_string
  end

  def add(maker, name, length, ring_gauge)
    cigar            = Cigar.new
    cigar.maker      = maker.rstrip
    cigar.name       = name.rstrip
    cigar.length     = length
    cigar.ring_gauge = ring_gauge
    if cigar.maker.empty? or cigar.maker.nil? or cigar.name.empty? or cigar.name.nil?
      raise ArgumentError
    elsif cigar.save
      "#{maker} #{name} #{length} #{ring_gauge} has been added\n"
    else
      "#{cigar.errors}"
    end
  end

  def new_cigar
    maker      = ask("Who made the cigar?")
    while maker.rstrip.empty?
      say("\"#{maker}\" is unacceptable!")
      maker = ("Who made the cigar")
    end
    name       = ask("What is the name of the cigar?")
    while name.rstrip.empty?
      says("\"#{name}\" is unacceptable!")
      name = aks("What is the name of the cigar?")
    end
    length     = ask("What is the length of the cigar?")
    while length.rstrip.empty?
      say("\"#{length}\" is unacceptable!")
      length = ask("What is the length of the cigar?")
    end
    ring_gauge = ask("What is the ring gauge?")
    ring_gauge = ring_gauge.to_i
    while ring_gauge.zero? or ring_gauge.nil?
      say("\"#{ring_gauge}\" is unacceptable!")
      ring_gauge = ask("What is the ring gauge?")
    end
    response = self.add(maker, name, length, ring_gauge)
    say(response) unless response.nil?
  end

  def delete_cigar
    cigars            = Cigar.count
    cigars_controller = CigarsController.new
    say("Which cigar do you want to delete?")
    user_input = ask(cigars_controller.return_info)
    while user_input.to_i > cigars or user_input.empty? or user_input.nil?
      say("That's not right..")
      user_input = ask(cigar_controller.new.return_info)
    end
    Database.execute("DELETE FROM cigars WHERE cigars.id == '#{user_input}'")
    Database.execute("DELETE FROM cigar_entries WHERE cigar_entries.cigar_id == '#{user_input}'")
    say("Cigar deleted!")
  end
end
