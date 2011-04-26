class Guest < ActiveRecord::Base
  attr_accessible :name, :email, :host_id, :notes
  
  #Validations
  validates_presence_of :email, :name, :host_id
  validates_uniqueness_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  #Relationships
  belongs_to :host, :dependent => :destroy
  has_many :invitations
  has_one :gift, :through => :invitation
  
  #Scopes
  #scope :all, where(:host_id => current_host)
  scope :all, order('name')
  
  #Callbacks
  before_validation_on_create(:random_invite_code)
  
  #Adds random invite code
  def random_invite_code
    self.invite_code = rand(36**16).to_s(36)
  end
  
end
