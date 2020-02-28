#
feature 'User can add to basket' do
  scenario 'Signed up user can add item to basket' do
    create_user
    visit '/heel1'
    select('7', from: :size_choice)
    click_button 'Add to basket'
    expect(page).to have_content "My Basket"
  end

  scenario 'Signed up user can see items in basket' do
    create_user
    visit '/heel1'
    select('7', from: :size_choice)
    click_button 'Add to basket'
    expect(page).to have_content "Shoe name: heel1"
    expect(page).to have_content "Shoe size: 7"
    expect(page).to have_content "Shoe colour: black"
  end
end
