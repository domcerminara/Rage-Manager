class PartyType < ActiveRecord::Base
  attr_accessible :name, :active
  
  has_many :parties
end
