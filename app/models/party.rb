class Party < ActiveRecord::Base
  attr_accessible :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :description, :rsvp_date
end
