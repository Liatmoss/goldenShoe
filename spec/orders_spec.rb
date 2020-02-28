require 'orders'

describe Orders do

  describe "add" do
    it 'creates a new order' do
        orders = Orders.add(shoe_id: 1, user_id: 1)
        expect(orders.shoe_id).to eq "1"
        expect(orders.user_id).to eq "1"
      end
    end

    describe "all" do
      it "returns first order" do
        orders = Orders.all
        expect(orders[0].user_id).to eq("1")
      end
    end
  end
