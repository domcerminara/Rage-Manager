class PartyType < ActiveRecord::Base
  attr_accessible :name, :active
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :parties
  
  scope :all, order('name')
  
end
