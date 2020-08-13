class User < ApplicationRecord
    has_many :reviews
    has_many :favorite_stores
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

end
