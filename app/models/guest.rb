class Guest < ActiveRecord::Base
  attr_accessible :name, :email, :host_id, :notes
  
  belongs_to :host
  has_many :invitations
  has_one :gift, :through => :invitation
  
end
