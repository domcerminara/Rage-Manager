class Guest < ActiveRecord::Base
  attr_accessible :name, :email, :host_id, :notes
  
  validates_presence_of :email, :name, :host_id
  validates_uniqueness_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  belongs_to :host, :dependent => :destroy
  has_many :invitations
  has_one :gift, :through => :invitation
  
end
