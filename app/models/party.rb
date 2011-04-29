class Party < ActiveRecord::Base
  attr_accessible :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :description, :rsvp_date

  validates_presence_of :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :rsvp_date
  validates_uniqueness_of :name
  validates_date :party_date, :on_or_after => lambda {Date.current}
  validates_date :rsvp_date, :on_or_after => lambda {Date.current}
  validates_date :rsvp_date, :on_or_before => :party_date
  validates_time :end_time, :after => :start_time

  belongs_to :host, :dependent => :destroy
  belongs_to :party_type
  belongs_to :location
  has_many :invitations
  has_many :guests, :through => :invitations
  
  scope :all, order('name')
end
