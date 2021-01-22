class Spell < ApplicationRecord
    belongs_to :book
    has_many :users, through: :books
end
