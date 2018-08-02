require_relative '../lib/rooble.rb'

describe Rooble do
  #acceptance test
  context "#User John Example" do
    let(:john_example) {
      Client.new({
        client_demos: "John Example",
        investment_cents: 100_000, 
        investment_ratio: {savings: 70, checking: 30}
      })
    }

    it "saves #user" do
      expect(john_example.client_demos).to eq "John Example"
      expect(john_example.savings.balance).to eq 70000
      expect(john_example.client_number.class).to eq Integer
    end
    it "computes deposits and withdrawals" do
      john_example.savings.change_balance(30000)
      expect(john_example.savings.balance).to eq 100000

      john_example.checking.change_balance(-100)
      expect(john_example.checking.balance).to eq 29900
    end
  end
end