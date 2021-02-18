class Spell < ApplicationRecord
    include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user }
    
    belongs_to :book
    has_many :users, through: :books

    validates :name, :description, presence: true
    validates :difficulty_level, :power_level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
    
    def book_attributes=(hash_of_attributes) #custom writer
        if !hash_of_attributes[:title].blank? && !hash_of_attributes[:genre].blank? && !hash_of_attributes[:difficulty].blank?
            self.book = Book.find_or_create_by(hash_of_attributes)
        end
    end

    def self.powerful
        self.where(power_level: 10)
    end
end
