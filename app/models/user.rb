class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   attachment :profile_image
   has_many :builds, dependent: :destroy
   has_many :favorites, dependent: :destroy

   validates :username, presence: true
   validates :email, presence: true

   def already_favorited?(build)
    self.favorites.exists?(build_id: build.id)
  end
end
