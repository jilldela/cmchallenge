require 'rspec'
require 'router'

describe Router do
  let(:req) { Rack::Request.new({'rack.input' => {}}) }

  describe '::matches?' do
    it 'returns true if method and path are matches' do
      expect(Router.matches?(req)).to eq()
    end
    it 'returns false if method or path do not match'
  end

  describe '::run' do
  end
end