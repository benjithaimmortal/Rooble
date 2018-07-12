require_relative '../lib/rooble.rb'

describe Rooble do
    context "with a prior client number" do
        it "doesn't randomize an existing client number" do
            test_client = Client.new("name", 999_999, {savings: 20, checking: 30, money_market: 50}, 91252)
            expect(test_client.client_number).to eq 91252
        end
    end
    context "with many accounts" do
        it "saves the correct percentage in each account" do
            test_percent = rand(1..100)
            test_client = Client.new("name", 100, {savings: test_percent, checking: (100 - test_percent)})
            expect(test_client.savings.balance).to eq (test_percent)
            expect(test_client.checking.balance).to eq (100-test_percent)
        end
    end
end
