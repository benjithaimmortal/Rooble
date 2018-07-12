require_relative '../lib/rooble.rb'

describe Rooble do
  #unit tests
  test_percent = rand(1..100)
  client_number = rand(10000..99999)
  test_client = Client.new("Test", 100, {savings: test_percent, checking: (100 - test_percent)}, client_number)

  context "with a prior client number" do
    it "doesn't randomize an existing client number" do
      expect(test_client.client_number).to eq client_number
    end
  end
  context "with many accounts" do
    it "saves the correct percentage in each account" do
      expect(test_client.savings.balance).to eq (test_percent)
      expect(test_client.checking.balance).to eq (100-test_percent)
    end
  end
  context "with an incorrect account type" do
    it "throws a NoSuchAccountTypeError" do
      expect{ test_client2 = Client.new("name", 100, {saving: 100}) }.to raise_error(NoSuchAccountTypeError)
    end
  end
  context "transaction limit" do
    it "counts down when applicable" do
      3.times { test_client.savings.change_balance(100) }
      expect(test_client.savings.transaction_limit).to eq 0
    end
    it "throws an error if zero" do
      expect { test_client.savings.change_balance(100) }.to raise_error(TransactionLimitError)
    end
  end


  #acceptance test
  context "User John Example" do
    john_example = Client.new("John Example", 100_000, {savings: 70, checking: 30})

    it "saves his initial user profile" do
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