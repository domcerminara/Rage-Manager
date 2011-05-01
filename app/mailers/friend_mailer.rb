class FriendMailer < ActionMailer::Base
  default :from => "dompkt2013@gmail.com"
  
  def new_invitation_msg(friend)
    @friend = friend
    mail(:to => friend.email, :subject => "You're Invited!")
  end

end
