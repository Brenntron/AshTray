require "highline/import"

class CigarsController
  def index
    if Cigar.count > 0
      cigars = Cigar.all
      cigars_string = ""
      cigars.each_with_index do |cigar, index|
        cigars_string << "#{index + 1}. #{cigar.name}\n"
      end
      cigars_string
    else
      "No cigars found. Add a cigar.\n"
    end
  end

  def add(name, length, ring_gauge)
    clean_name   = name.strip
    clean_length = length.strip

    cigar = Cigar.new(clean_name)
    cigar.length(clean_length)
    cigar.ring_gauge(ring_gauge)
    if cigar.save
      "\"#{name}\" has been added\n"
    else
      cigar.errors
    end
  end
end
