require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  #relationship test
  should belong_to :guest
  should belong_to :party
  
  #validation check
  should numericality_of :guest_id
  should numericality_of :expected_attendees
  should numericality_of :party_id
   

  should allow_value("2").for(:expected_attendees)
  should_not allow_value("My Brother").for(:expected_attendees)

  #factories to test scope
  setup do
    @invite = Factory.create(:invitation, :party_id => 1, :guest_id => 1)
    @invite.random_invite_code
  end
  
  setup do
    @invitedouble = Factory.create(:invitation, :party_id => 1, :guest_id => 1)
  end
  
  should "be 16 characters long" do
    assert_equal 16, @invite.invite_code.length
  end
  
  should "return nil" do
    assert_equal nil,  @invitedouble.alreadyinvited
  end
  
  teardown do
    @invite.destroy
  end
  
  teardown do
    @invitedouble
  end
end