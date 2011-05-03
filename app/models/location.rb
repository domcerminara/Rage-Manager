class Location < ActiveRecord::Base
  attr_accessible :host_id, :name, :street, :city, :state, :zip, :latitude, :longitude

  #Validations
  validates_presence_of :name, :street, :city, :state, :zip
  validates_uniqueness_of :name
  validates_numericality_of :zip
  validates_length_of :zip, :is => 5

  #Relationships
  belongs_to :host, :dependent => :destroy
  has_many :parties  
  
  #Callbacks
  before_save :find_location_coordinates
  
  #Scopes
  scope :all, order('name')
  
  def create_map_link(zoom=13,width=800,height=800)
      markers = "&markers=color:red%7Ccolor:red%7Clabel:#{1}%7C#{self.latitude},#{self.longitude}"
    map =
    "http://maps.google.com/maps/api/staticmap?center=#{latitude},#{longitude}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  end
  
  private
  def find_location_coordinates
    coord =  Geokit::Geocoders::GoogleGeocoder.geocode "#{self.street}, #{self.city}, #{self.state}"
    if coord.success
      self.latitude, self.longitude = coord.ll.split(',')
    else
      errors.add_to_base("Error with geocoding")
    end
  end
  
end
