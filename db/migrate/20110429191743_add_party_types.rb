class AddPartyTypes < ActiveRecord::Migration
  def self.up
    defaulta = PartyType.new
    defaulta.name = "Graduation Party"
    defaulta.save!
    defaultb = PartyType.new
    defaultb.name = "Baby Shower"
    defaultb.save! 
    defaultc = PartyType.new
    defaultc.name = "Birthday Party" 
    defaultc.save!
    defaultd = PartyType.new
    defaultd.name = "Generic Party"
    defaultd.save! 
  end

  def self.down
  end
end
