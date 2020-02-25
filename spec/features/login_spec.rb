require './spec/web_helpers'

feature 'User can login' do
  scenario 'Signed up user can login with email and password' do
    create_user
    click_link("Sign out")
    click_link("Sign In")
    fill_in("email", with: "test@test.com")
    fill_in("password", with: "123456")
    click_button("Submit")
    expect(page).to have_link "Sign out"
  end
end
