class UserNotification < ActiveRecord::Base
  belongs_to :notification
  belongs_to :user
  
  attr_accessible :confirmed_at
end
