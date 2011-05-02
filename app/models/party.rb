class Party < ActiveRecord::Base
  attr_accessible :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :description, :rsvp_date

  #Validations
  validates_numericality_of :party_type_id
  validates_presence_of :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time
  validates_date :party_date, :on_or_after => lambda {Date.current}
  validates_date :rsvp_date, :on_or_after => lambda {Date.current}, :allow_blank => true
  validates_date :rsvp_date, :on_or_before => :party_date, :allow_blank => true
  validates_time :end_time, :after => :start_time

  #Relationships
  belongs_to :host, :dependent => :destroy
  belongs_to :party_type
  belongs_to :location
  has_many :invitations
  has_many :guests, :through => :invitations
  
  #Scopes
  scope :all, order('name')
  
  #Get total amount of expected guests
  def expected
    self.invitations.sum('expected_attendees')
  end
  
  #Get total amount of attending guests
  def attending
    self.invitations.sum('actual_attendees')
  end
end
