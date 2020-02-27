feature "product page" do

  scenario "view product page" do
    visit '/heel1'
    select('7', from: :size_choice)
    expect(page).to have_content "7"
  end
end
