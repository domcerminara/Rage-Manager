class AddDefaulHost < ActiveRecord::Migration
  def self.up
    default = Host.new
    default.first_name = "Mrs"
    default.last_name ="H"
    default.username = "MrsH"
    default.email = "dcermina@andrew.cmu.edu"
    default.password = "alex&mark"
    default.password_confirmation = "alex&mark"
    default.save!    
  end

  def self.down
    default = Host.where("username = ?", "default").first
    Host.delete default
  end
end

