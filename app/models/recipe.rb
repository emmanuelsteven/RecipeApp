class Recipe < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :preparation_time, :integer
  attribute :cooking_time, :integer
  attribute :description, :text
  attribute :public, :boolean

  # Associations
  belongs_to :user

  # validations
  validates :name, presence: true
  validates :preparation_time, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false] }
  validates :user_id, presence: true
end
