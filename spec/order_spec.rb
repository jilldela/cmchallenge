require 'rspec'
require 'order'

describe "#matches?" do
  let(:order) { Order.new("123", "1", "3") }

  context 'verifies order number matches customer and shop IDs' do
    it "returns true with correct parameters" do
      expect(order.matches?({
        "orderID" => "123",
        "userID_customer" => "1",
        "userID_shop" => "3"
      })).to be_truthy
    end
    
    it "returns false with incorrect parameters" do
      expect(order.matches?({
        "orderID" => "456",
        "userID_customer" => "1",
        "userID_shop" => "3"
      })).to be_falsy
    end
  end
end

describe "::find_order" do
  it "finds orders by orderID" do
    expect(Order.find_order("123")).to contain_exactly(["123", "1", "3"])
  end
  it "returns empty if orderID not found" do
    expect(Order.find_order("101")).to contain_exactly()
  end
end