class Build < ApplicationRecord

belongs_to :user
attachment :image
end
