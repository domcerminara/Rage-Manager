class Gift < ActiveRecord::Base
  attr_accessible :invitation_id, :description, :note_sent_on
  
  belongs_to :invitation
end
