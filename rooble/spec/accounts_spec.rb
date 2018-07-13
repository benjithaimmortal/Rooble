require_relative '../lib/rooble.rb'

describe Rooble do
  #unit tests
  test_percent = rand(1..100)
  client_number = rand(10000..99999)
  test_client = Client.new("Test", 100, {savings: test_percent, checking: (100 - test_percent)}, client_number)

  context "many #accounts" do
    it "gives correct percentages to each" do
      expect(test_client.savings.balance).to eq (test_percent)
      expect(test_client.checking.balance).to eq (100-test_percent)
    end
  end
  context "incorrect #account_type?" do
    it ".NoSuchAccountTypeError" do
      expect{ test_client2 = Client.new("name", 100, {saving: 100}) }.to raise_error(NoSuchAccountTypeError)
    end
  end
  context "transaction_limit?" do
    it "counts down" do
      3.times { test_client.savings.change_balance(100) }
      expect(test_client.savings.transaction_limit).to eq 0
  end
    it "0? .TransactionLimitError" do
      expect { test_client.savings.change_balance(100) }.to raise_error(TransactionLimitError)
    end
  end  
end