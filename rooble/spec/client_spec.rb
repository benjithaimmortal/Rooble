require_relative '../lib/rooble.rb'

describe Rooble do
  #unit tests  
  let(:test_percent) { rand(1..100) }
  let(:client_number) { rand(10000..99999) }
  let(:test_client) { Client.new({
    client_demos: "Test",
    investment_cents: 100,
    investment_ratio: {savings: test_percent, checking: (100 - test_percent)},
    client_number: client_number 
  }) }

  context "#client_number?" do
    it "doesn't make new one" do
      expect(test_client.client_number).to eq client_number
    end
  end
end
