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

  def get_name(name)
    @name = name.strip
  end

  def get_length(length)
    @length = length.strip
  end

  def get_ring_gauge(ring_gauge)
    @ring_gauge = ring_gauge.to_i
  end

  def add
    cigar = Cigar.new(@name, @length, @ring_gauge)
    if cigar.save_cigar
      "\"#{name}\" has been added\n"
    else
      cigar.errors
    end
  end
end
