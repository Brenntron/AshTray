require "highline/import"

class CigarsController
  def index
    if Cigar.count > 0
      cigars = Cigar.all
      cigars_string = ""
      cigars.each_with_index do |cigar, index|
        cigars_string << "#{index + 1}. #{cigar.maker} #{cigar.name} #{cigar.length}\n"
      end
      cigars_string
    else
      "No cigars found. Add a cigar.\n"
    end
  end

  def add(maker, name, length, ring_gauge)
    cigar            = Cigar.new
    cigar.maker      = maker
    cigar.name       = name
    cigar.length     = length
    cigar.ring_gauge = ring_gauge
    if cigar.save
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
end
