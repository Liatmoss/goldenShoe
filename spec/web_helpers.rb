def create_user
  visit '/'
  click_link("Sign In")
  click_link ("Not yet a member?")
  fill_in("fullname", with: "Test User")
  fill_in("email", with: "test@test.com")
  fill_in("password", with: "123456")
  click_button("Signup")
end
