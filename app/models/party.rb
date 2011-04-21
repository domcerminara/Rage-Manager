class Party < ActiveRecord::Base
  attr_accessible :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :description, :rsvp_date

  has_one :host
  has_one :party_type
  has_one :location
  has_many :invitations
  has_many :guests, :through => :invitations
end
