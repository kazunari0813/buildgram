class Build < ApplicationRecord

validates :title, presence: :true, length: {maximum: 30}
validates :body, presence: :true
validates :image, presence: :true

belongs_to :user
has_many :favorites, dependent: :destroy
attachment :image
end
