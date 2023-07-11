class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

   after_commit :create_notification,on: :create
 private


 def create_notification
  Notification.create do |notificaion|
    notificaion.notify_type = 'post'
    notificaion.actor = self.user
    notificaion.user = self.post.user
    notificaion.target = self
    notificaion.second_target = self.post
  end
 end
end
