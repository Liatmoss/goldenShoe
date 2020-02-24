require "user"

describe User do

  describe("add") do
    it "adds a single user" do
      user = User.add(fullname: "Liat Moss", email: "liat@test.com", password:"123456")
      expect(user.email).to eq "liat@test.com"
    end
  end

  describe "select a user" do
    it "returns 1 user" do
      returnedUser = User.add(fullname: "Liat Moss", email: "liat@test.com", password:"123456")
      user = User.where(id: returnedUser.id)
      expect(user.id).to eq(returnedUser.id)
    end
  end

  describe 'authenticate' do
    it 'user can authenticate' do
      returnedUser = User.add(fullname: "Liat Moss", email: "liat@test.com", password:"123456")
      user = User.authenticate(email: "liat@test.com", password:"123456")
      expect(user.email).to eq "liat@test.com"
      expect(user.password).to eq "123456"
    end
  end
end
