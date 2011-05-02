class FriendMailer < ActionMailer::Base
  default :from => "dompkt2013@gmail.com"
  
  def new_invitation_msg(invitation)
    @invitation = invitation
    mail(:to => invitation.guest.email, :subject => "Join the Party!")
  end

end
