class Location < ActiveRecord::Base
  attr_accessible :host_id, :name, :street, :city, :state, :zip, :latitude, :longitude

  validates_presence_of :name, :street, :city, :state, :zip, :latitude, :longitude
  validates_unqiqueness_of :name
  validates_numericality_of :zip, :latitude, :longitude
  validates_length_of :zip, :is => 5

  belongs_to :host, :dependent => :destroy
  has_many :parties  
  
  scope :all, order('name')
  
end
