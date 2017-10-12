require 'rspec'
require 'license'
require 'byebug'

describe "#add_licenseKey" do
  subject(:license) { License.new("userID_customer" => 3, "licenseKey" => "jfioafjewoaj") }

  it "inserts new license into database" do
    expect{ license.add_licenseKey }.to_not raise_error

    expect(license.find_licenseKey.flatten).to include(license.userID.to_s, license.licenseKey)
  end
end