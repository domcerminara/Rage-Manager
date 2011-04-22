class Invitation < ActiveRecord::Base
  attr_accessible :party_id, :guest_id, :invite_code, :expected_attendees, :actual_attendees

  validates_presence_of :party_id, :guest_ide, :invite_code, :expected_attendees, :actual_attendees
  validates_numericality_of :expected_attendees, :only_integer => true, :greater_than => 0
  validates_numericality_of :actual_attendees, :only_integer => true, :greater_than => 0
  validates_uniqueness_of :invite_code

  has_many :gifts
  belongs_to :guest
  belongs_to :party
end
