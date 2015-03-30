class SeedNeighborhoods < ActiveRecord::Migration
  def change
    Neighborhood.delete_all()

    ["wa", "or"].each do |state|
        contents = File.read("#{Rails.root}/db/data/neighborhoods/#{state}.json")
        geom = RGeo::GeoJSON.decode(contents, :json_parser => :json)
        geom.each do |neighborhood|
            county = neighborhood.properties["COUNTY"]
            city = neighborhood.properties["CITY"]
            name = neighborhood.properties["NAME"]
            neighborhood = Neighborhood.create(:state => state, :county => county, :city => city, :name => name, :region => neighborhood.geometry)
            ActiveRecord::Base.connection.execute("UPDATE neighborhoods SET center=Centroid(region) WHERE id=#{neighborhood.id}");
        end
    end
  end
end
