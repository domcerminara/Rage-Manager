class AddDefaultPartyTypes < ActiveRecord::Migration
  def self.up
    defaulta = PartyType.new
    defaulta.name = "Graduation Party"
    defaultb = PartyType.new
    defaultb.name = "Baby Shower" 
    defaultc = PartyType.new
    defaultc.name = "Birthday Party" 
    defaultd = PartyType.new
    defaultd.name = "Generic Party"    
  end

  def self.down
  end
end
