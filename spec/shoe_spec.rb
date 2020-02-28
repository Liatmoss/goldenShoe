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

  describe "Out of stock" do
    it "returns out of stock shoes" do
      out_of_stock = Shoe.where(shoe_name: 'heel1', shoe_stock: 0)
      expect(out_of_stock.length).to eq (2)
    end
  end

  describe "select specific shoe size" do
    it "finds the id of a shoe in a specific size" do
      shoes = Shoe.select(shoe_size: 7)
      expect(shoes).to eq 4
    end
  end

  describe "finds specific users shoe from order" do
    it "finds a shoe based on id" do
      shoes = Shoe.shoe_order(id: 1)
      expect(shoes[0].shoe_size).to eq("4")
    end
  end

end
