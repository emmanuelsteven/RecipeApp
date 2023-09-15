class Recipe < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :preparation_time, :integer
  attribute :cooking_time, :integer
  attribute :description, :text
  attribute :public, :boolean

  # Associations
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  attribute :public, :boolean, default: false

  # validations
  validates :name, presence: true
  validates :description, presence: true
end
