require 'rack'
require 'rspec'
require 'controller'

describe Controller do
  let(:req) { Rack::Request.new({'rack.input' => {}}) }
  let(:res) { Rack::MockResponse.new('200',{},[]) }
  let(:controller) { Controller.new(req, res) }
  let(:order) { Order.new("123", "1", "3") }

  # describe '#run' do

  # end

  # describe '#verify_order' do
  #   before(:each) do
  #     controller.verify_order(order)
  #   end

  #   it 'renders email if matched' do

  #   end

  #   it 'sets response body if not found' do
  #     expect(res).to receive(write)
  #   end

  #   it 'sets response status if not found' do
  #     expect(res.status).to eq(404)
  #   end
  # end

  describe '#increment_license_count' do
    it 'finds correct user' do
    end

    it 'increments license count for found user' do
    end
  end

end