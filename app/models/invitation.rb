class Invitation < ActiveRecord::Base
  attr_accessible :party_id, :guest_id, :invite_code, :expected_attendees, :actual_attendees

  #Validations
  validates_presence_of :party_id, :guest_id, :expected_attendees
  validates_numericality_of :expected_attendees, :only_integer => true, :greater_than => 0
  validates_numericality_of :party_id, :guest_id
   
  #Relationships
  has_many :gifts
  belongs_to :guest
  belongs_to :party
  has_one :host, :through => :guest
  
  #Scopes
  scope :all, order('party_id')
  
  #Callbacks
  before_validation_on_create(:random_invite_code)
  
  #Adds random invite code
  def random_invite_code
    self.invite_code = rand(36**16).to_s(36)
  end
  
  #Checks if already invited
  def already_invited
    Invitation.find_by_guest_id_and_party_id(guest_id, party_id)
  end
  
end
