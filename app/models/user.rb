class User < ApplicationRecord
    include PublicActivity::Model
    tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }
    
    has_many :books, dependent: :delete_all
    has_many :spells, through: :books
    has_one :wand
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
