require 'rails_helper'

feature "Pets", type: :feature do
  scenario 'Verify new pet link' do
    visit(root_path)
    expect(page).to have_link('New Pet')
  end

  scenario 'Verify new pet form' do
    visit(pets_path)
    click_on('New Pet')
    expect(page).to have_content('New Pet')
  end

  scenario 'Pet Create' do
    visit(new_pet_path)
    pet_name = Faker::Creature::Dog.name
    fill_in('Nome', with: pet_name)
    fill_in('Data de Nascimento', with: Faker::Date.birthday(max_age: 18)) 
    fill_in('Raça', with: Faker::Creature::Dog.breed)
    click_on('Create Pet')
    
    expect(page).to have_content('Pet successfuly created!')
    expect(Pet.last.name).to eq(pet_name)
  end
  
  scenario 'Pet Create errors' do
    visit(new_pet_path)
    click_on('Create Pet')
    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'Pet Show' do
    pet = create(:pet)
    visit(pet_path(pet.id))
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.birthdate)
    expect(page).to have_content(pet.breed)
  end

  scenario 'Index Test' do
    pet1 = create(:pet)
    pet2 = create(:pet)
    visit(pets_path)
    expect(page).to have_content(pet1.name).and have_content(pet2.name)
    expect(page).to have_content(pet1.birthdate).and have_content(pet2.birthdate)
    expect(page).to have_content(pet1.breed).and have_content(pet2.breed)
  end

  scenario 'Pet Edit/Update' do
    pet = create(:pet)
    
    new_name = Faker::Creature::Dog.name
    visit(edit_pet_path(pet.id))
    fill_in('Nome', with: new_name)
    click_on('Update Pet')

    expect(page).to have_content('Pet successfuly updated!')
    expect(page).to have_content(new_name)
  end

  scenario 'Verify Show link on Index' do
    pet = create(:pet)
    visit(pets_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[5]/a").click
    expect(page).to have_content('Show Pet')
  end

  scenario 'Verify Edit link on Index' do
    pet = create(:pet)
    visit(pets_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[6]/a").click
    expect(page).to have_content('Edit Pet')
  end

  scenario 'Delete Pet', jd: true do
    pet = create(:pet)
    visit(pets_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[7]/a").click
    2.seconds
    #page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Pet successfuly deleted!')
  end
end
