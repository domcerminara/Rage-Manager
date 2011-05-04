require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  #relationship test
  should belong_to :host
  should have_many :parties
  
  #validation check
  should validate_presence_of :name
  should validate_presence_of :street 
  should validate_presence_of :state
  should validate_presence_of :city
  should validate_presence_of :zip
  should validate_numericality_of :zip

  should allow_value("17036").for(:zip)
  should allow_value("My House").for(:name)
  should_not allow_value("23847893074").for(:zip)

  #factories to test scope
  setup do
    @place = Factory.create(:location, :name => place)
  end
  
  setup do
    @spot = Factory.create(:location, :name => spot)
  end
  
  should "have 2 guests" do
    assert_eqaul 2, Location.all.size
  end
    
  teardown do
    @spot.destroy
  end
  
  teardown do
    @place.destroy
  end
end
