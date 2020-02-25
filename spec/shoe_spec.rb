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

#   describe "Out of stock" do
#   it "returns out of stock shoes" do
#     shoes = Shoe.all
#     out_of_stock = Shoe.where(shoe_name: 'heel1', shoe_stock: 0)
#     expect(out_of_stock).to include ("status=PGRES_TUPLES_OK ntuples=2 nfields=7 cmd_tuples=2").to_str
#   end
# end

end
