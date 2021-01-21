require 'pg'

class Listing
  def self.get_listings 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'MakersBnB_Test')
    else
      connection = PG.connect(dbname: 'MakersBnB')
    end

    result = connection.exec("SELECT * FROM listings;" )
    result.map do |list|
      { name: list["name"], price: list["price"], available_from: list["available_from"], available_to: list["available_to"], description: list["description"]}
    end
  end
end