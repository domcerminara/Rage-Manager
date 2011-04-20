class Gift < ActiveRecord::Base
  attr_accessible :invitation_id, :description, :note_sent_on
end
