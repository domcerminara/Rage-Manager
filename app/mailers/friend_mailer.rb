class FriendMailer < ActionMailer::Base
  default :from => "dompkt2013@gmail.com"
  
  def new_invitation_msg(invitation)
    @invitation = invitation
    mail(:to => invitation.guest.email, :subject => "You're Invited!")
  end

end
