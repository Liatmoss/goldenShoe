require "user"

describe User do

  describe("add") do
    it "adds a single user" do
      user = User.add(fullname: "Liat Moss", email: "liat@test.com",password:"123456")
      expect(user.email).to eq "liat@test.com"
    end
  end
end
