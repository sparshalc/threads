class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         followability

         has_one_attached :image
         has_many :posts
         has_many :comments, dependent: :destroy
         has_many :likes,dependent: :destroy

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
