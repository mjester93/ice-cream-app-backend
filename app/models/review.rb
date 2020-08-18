class Review < ApplicationRecord
    belongs_to :user
    belongs_to :store

    has_one_attached :avatar

end
