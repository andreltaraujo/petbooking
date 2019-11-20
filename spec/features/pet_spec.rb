require 'rails_helper'

feature "Pets", type: :feature do
  scenario 'Verify link new pet' do
    visit(root_path)
    expect(page).to have_link('New Pet')
  end

  scenario 'Verify link new pet' do
    visit(root_path)
    click_on('New Pet')
    expect(page).to have_content('Pets')
    expect(page).to have_link('New Pet')
  end

  scenario 'Create pet' do
    visit(new_pet_path)
    pet_name = Faker::Creature::Dog.name
    fill_in('Name', with: pet_name)
    fill_in('Birthdate', with: Faker::Date.birthday(max_age:18)) 
    fill_in('Breed', with: Faker::Creature::Dog.breed)
    click_on('Create Pet')
    expect(page).to have_content('Pet create successfuly!')
    expect(Pet.last.name).to eq(pet_name)
  end
end
