class InvitationsController < ApplicationController
before_filter :login_required
  def index
    @invitations = current_host.invitations.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    old = @invitation.already_invited
    if old.nil?
      @invitation.random_invite_code
    else
      @invitation.invite_code = old.invite_code
    end
    if @invitation.save
      if old.nil?
        FriendMailer.new_invitation_msg(@invitation).deliver
        redirect_to @invitation, :notice => "Invitation was successfully created" 
      else
        old.destroy
        redirect_to @invitation, :notice  => "The invitation for this guest has been updated."
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end
  
  def details
    
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(params[:invitation])
      redirect_to @invitation, :notice  => "The invitation for this guest has been updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitations_url, :notice => "Successfully destroyed invitation."
  end
end
