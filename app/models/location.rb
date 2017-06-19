class Location < ApplicationRecord
  geocoded_by :name
  before_validation :geocode
  validates_presence_of :name, :latitude, :longitude
end
