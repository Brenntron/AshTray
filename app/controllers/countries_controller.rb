class CountriesController
  def index
    Country.all.each do |country|
      say("The country of origin is #{country.name}.")
    end
  end
end
