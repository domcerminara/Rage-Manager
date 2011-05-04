require 'test_helper'

class PartyTypeTest < ActiveSupport::TestCase
  #relationship test
  should have_many :parties
  
  #validation check
  should validate_presence_of :name
  should validate_uniqueness_of :name 

  should allow_value("Gathering).for(:name)
  should allow_value("Huge Party").for(:name)

  #factories to test scope
  setup do
    @typeone = Factory.create(:party_type, :name => type1)
  end
  
  setup do
    @typetwo = Factory.create(:party_type, :name => type2)
  end
  
  should "have 2 party_types" do
    assert_eqaul 2, PartyType.all.size
  end
    
  teardown do
    @typeone.destroy
  end
  
  teardown do
    @typetwo.destroy
  end
end
