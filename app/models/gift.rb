class Gift < ActiveRecord::Base
  attr_accessible :invitation_id, :description, :note_sent_on
  
  #Validations
  validates_presence_of :invitation_id, :description, :note_sent_on
  
  #Relationships
  belongs_to :invitation, :dependent => :destroy
  has_one :guest, :through => :invitations
  
  #Scope
  scope :all, order('invitation_id')
  
end
