class Book < ApplicationRecord
    has_many :spells
    belongs_to :user
end
