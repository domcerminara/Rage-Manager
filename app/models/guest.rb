class Guest < ActiveRecord::Base
  attr_accessible :name, :email, :host_id, :notes
  
  #Validations
  validates_presence_of :email, :name, :host_id
  validates_uniqueness_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => " is not a valid format"
  
  #Relationships
  belongs_to :host, :dependent => :destroy
  has_many :invitations
  has_many :gifts, :through => :invitations
  
  #Scopes
  scope :all, order('name') 
  
end
