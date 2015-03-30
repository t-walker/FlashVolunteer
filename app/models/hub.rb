class Hub < ActiveRecord::Base

  attr_accessible :name, :city_state, :center, :zoom, :radius 

  def self.closest(point)
    self.find_by_sql("SELECT *, (GLength(LineString(GeomFromText('#{point}'), center))) AS distance FROM hubs ORDER BY distance ASC LIMIT 1").first
  end

  def latitude
    center.y
  end

  def longitude
    center.x
  end
end
