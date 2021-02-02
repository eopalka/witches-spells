class Wand < ApplicationRecord
  include PublicActivity::Model
  tracked
  
  belongs_to :user

  validates :name, :wood, :core, presence: true
  validates :length, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 20}
end
