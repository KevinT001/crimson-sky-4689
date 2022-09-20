require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients). through(:dish_ingredients)}
  end

  describe "dish model method" do 
    before :each do 
      @chef1 = Chef.create!(name: "Jordan Hamsey")
      @chef2 = Chef.create!(name: "Bolfgang Shuck")

      @dish1 = Dish.create!(name: "rotton biscuits", description: "Wormy bread", chef_id: @chef1.id )
      @dish2 = Dish.create!(name: "burnt fish", description: "Charred goldfish", chef_id: @chef1.id )
      @dish3 = Dish.create!(name: "moldy steak", description: "Rare green ribeye", chef_id: @chef2.id )
    
      @ingredient1 = Ingredient.create!(name: "Fuzzy cheddar", calories: 200 )
      @ingredient2 = Ingredient.create!(name: "3 eyed fish", calories: 300 )
      @ingredient3 = Ingredient.create!(name: "mystery meat", calories: 400 )
      @ingredient4 = Ingredient.create!(name: "stale cereal", calories: 100 )

      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient4.id)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
      DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
      DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient1.id)
    end
    it 'dishes total calories' do 

      expect(@dish1.dish_total_cals).to eq(300)
    end
  end
end