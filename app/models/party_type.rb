class PartyType < ActiveRecord::Base
  attr_accessible :name, :active
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  belongs_to :party
  has_one :host, :through => :party
  
  scope :all, order('name')
  
end
