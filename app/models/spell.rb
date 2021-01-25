class Spell < ApplicationRecord
    belongs_to :book
    has_many :users, through: :books

    validates :name, :description, presence: true
    validates :difficulty_level, :power_level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
end
