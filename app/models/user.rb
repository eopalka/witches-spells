class User < ApplicationRecord
    has_many :books
    has_many :spells, through: :books
    has_one :wand
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
