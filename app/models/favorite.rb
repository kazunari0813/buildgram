class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :build

	validates_uniqueness_of :build_id, scope: :user_id
end
