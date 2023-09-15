# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create recipe records associated with users
Recipe.create!(
  name: 'Spaghetti Carbonara',
  preparation_time: 20,
  cooking_time: 15,
  description: 'A classic Italian pasta dish...',
  public: true,
  user_id: 1
)

Recipe.create!(
  name: 'Chicken Alfredo',
  preparation_time: 30,
  cooking_time: 25,
  description: 'Creamy chicken and pasta...',
  public: false,
  user_id: 1
)
# Add more recipes and users as needed
