class Invitation < ActiveRecord::Base
  attr_accessible :party_id, :guest_id, :invite_code, :expected_attendees, :actual_attendees

  has_many :gifts
  belongs_to :guest
  belongs_to :party
end
