class Spell < ApplicationRecord
    belongs_to :book
    has_many :users, through: :books


    def book_attributes=(hash_of_attributes)
        if !hash_of_attributes[:title].blank? && !hash_of_attributes[:genre].blank? && !hash_of_attributes[:difficulty].blank?
            self.book = Book.find_or_create_by(hash_of_attributes)
        end
    end

    validates :name, :description, presence: true
    validates :difficulty_level, :power_level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
end
