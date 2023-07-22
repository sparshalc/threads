class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "title", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        []
    end
    has_one_attached :image
    belongs_to :user
    has_many :comments,dependent: :destroy
    has_many :likes,dependent: :destroy

    validates :title, presence: true
end
