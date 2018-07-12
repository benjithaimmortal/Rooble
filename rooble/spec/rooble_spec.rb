require_relative '../lib/rooble.rb'

RSpec.describe Rooble, @client_number do
    context "with a prior client number" do
        it "saves the client number" do
            test_client = Client.new("name", 999_999, {savings: 20, checking: 30, money_market: 50}, 91252)
            expect(test_client.client_number).to eq 91252
        end
    end
end
