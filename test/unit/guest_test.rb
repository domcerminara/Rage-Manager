require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  #relationship test
  should belong_to :host
  should have_many :invitations
  
  #validation check
  should validate_presence_of :name
  should validate_presence_of :email 

  should allow_value("Bro").for(:name)
  should allow_value("My Man").for(:name)
  should_not allow_value("Bro@bro,com").for(:email)
  should allow_value("Bro@bro.com").for(:email)

  #factories to test scope
  setup do
    @bro = Factory.create(:guest, :name => bro)
  end
  
  setup do
    @man = Factory.create(:guest, :name => man)
  end
  
  should "have 2 parties" do
    assert_eqaul 2, Guest.all.size
  end
    
  teardown do
    @bro.destroy
  end
  
  teardown do
    @man.destroy
  end

end
