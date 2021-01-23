class User < ApplicationRecord
    has_many :books
    has_many :spells, through: :books
    has_one :wand
    has_secure_password
end
