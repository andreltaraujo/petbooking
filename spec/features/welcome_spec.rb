require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Show welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end
  scenario 'Verify new pet link' do
    visit(root_path)
    expect(page).to have_selector('ul li')
    expect(find('ul li')).to have_link('New Pet')
  end
end
