class Book < ApplicationRecord
    #include PublicActivity::Model
    #tracked owner: ->(controller, model) { controller && controller.current_user }
    
    has_many :spells, dependent: :delete_all
    belongs_to :user

    validates :title, presence: true, uniqueness: true
    validates :genre, presence: true
    validates :difficulty, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 5}

    accepts_nested_attributes_for :spells, reject_if: proc { |attributes| attributes['name'].blank? || attributes['description'].blank? || attributes['difficulty_level'].blank? || attributes['power_level'].blank?  }

    def self.alphabetize
        Book.order(title: :asc)
    end

    def self.most_recent_books
        Book.order(created_at: :desc).limit(4)
    end
end
