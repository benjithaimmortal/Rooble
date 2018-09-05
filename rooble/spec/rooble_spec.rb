require_relative '../lib/rooble.rb'

describe Rooble do
  #acceptance test
  context "#User John Example" do
    john_example = Client.new("John Example", 100_000, {savings: 70, checking: 30})

    it "saves #user" do
      expect(john_example.client_name).to eq "John Example"
      expect(john_example.savings.balance).to eq 70000
      expect(john_example.balances.class).to eq Hash
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