class Store < ApplicationRecord
    has_many :reviews
    has_many :favorite_stores
    has_many :ice_cream_stores
    has_many :ice_creams, through: :ice_cream_stores
    
    def ice_cream_count
        return self.ice_creams.count
    end
end
