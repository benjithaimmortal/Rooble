require_relative '../lib/rooble.rb'

describe Rooble do
  let(:test_client) { Client.new({
    client_demos: "Test",
    investment_cents: 100,
    investment_ratio: {savings: 100}
  }) }


  context "#accounts?" do
    it "can access balances" do
#      expect().to eq 
    end
  end
end