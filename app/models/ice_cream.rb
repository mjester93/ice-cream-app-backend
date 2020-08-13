class IceCream < ApplicationRecord
    has_many :ice_cream_stores
    has_many :stores, through: :ice_cream_stores

end
