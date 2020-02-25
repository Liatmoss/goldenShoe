require "shoe"

describe Shoe do

  describe "view all" do
    it "Shows stock for a given shoe size" do
      shoes = Shoe.all
      expect(shoes[0].shoe_stock).to eq("100")
    end

    it "Shows stock for a given shoe size" do
      shoes = Shoe.all
      expect(shoes[2].shoe_stock).to eq("0")
    end
  end
end
