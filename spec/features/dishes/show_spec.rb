require 'rails_helper'

RSpec.describe 'dishes show page US_1' do 

  before :each do 
    @chef1 = Chef.create!(name: "Jordan Hamsey")
    @chef2 = Chef.create!(name: "Bolfgang Shuck")

    @dish1 = Dish.create!(name: "rotton biscuits", description: "Wormy bread", chef_id: @chef1.id )
    @dish2 = Dish.create!(name: "burnt fish", description: "Charred goldfish", chef_id: @chef1.id )
    @dish3 = Dish.create!(name: "moldy steak", description: "Rare green ribeye", chef_id: @chef2.id )
  
    @ingredient1 = Ingredient.create!(name: "Fuzzy cheddar", calories: 200 )
    @ingredient2 = Ingredient.create!(name: "3 eyed fish", calories: 200 )
    @ingredient3 = Ingredient.create!(name: "mystery meat", calories: 200 )
    @ingredient4 = Ingredient.create!(name: "Fuzzy cheddar", calories: 200 )

    
  end
  it 'I see the dishes name and description' do 

    visit "/dishes/#{@dish1.id}"
    # visit dish_path(@dish1)

    expect(page).to have_content("#{@dish1.name}")
    expect(page).to have_content("#{@dish1.description}")
    
    expect(page).to_not have_content("#{@dish2.name}")
    expect(page).to_not have_content("#{@dish2.description}")

  end

  it 'I see a list of ingredients for that dish' do 


  end

  it 'I see a the chefs name' do 

  end



end