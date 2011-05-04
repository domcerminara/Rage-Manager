require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :host_id
  should validate_presence_of :party_type_id
  should validate_presence_of :party_date
  should validate_presence_of :start_time
  should validate_presence_of :end_time
  
  setup do
    @bash = Factory.create(:party)
  end
  
  #Test guests methods
  should "have no expected guests" do
    assert_equal self.invitatoins.sum('expected_attendees'), 0
  end
  
  should "have no confirmed guests" do
    assert_equal nil, self.invitations.sum('actual_attendees')
  end
  
  teardown do
    @bash.destroy
  end
end
