class Location < ActiveRecord::Base
  attr_accessible :host_id, :name, :street, :city, :state, :zip, :latitude, :longitude

  belongs_to :host
  has_many :parties  
end
