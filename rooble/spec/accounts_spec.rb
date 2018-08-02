require_relative '../lib/rooble.rb'

describe Rooble do
  #unit tests
  let(:test_percent) { rand(1..100) }
  let(:client_number) { rand(10000..99999) }
  let!(:test_client) do 
    Client.new({
      client_number: client_number,
      investment_cents: 100,
      investment_ratio: {savings: test_percent, checking: (100-test_percent)}
    })
  end
  let(:test_client2) { Client.new({investment_cents: 1, investment_ratio: {saving: 100}}) }
  

  context "many #accounts" do
    it "gives correct percentages to each" do
      expect(test_client.savings.balance).to eq (test_percent)
      expect(test_client.checking.balance).to eq (100-test_percent)
    end
  end
  context "incorrect #account_type?" do
    it ".NoSuchAccountTypeError" do
      expect(test_client2).to raise_error(NoSuchAccountTypeError)
    end
  end
  context "transaction_limit?" do
    it "counts down" do
      3.times { test_client.savings.change_balance(100) }
      expect(test_client.savings.transaction_limit).to eq 0
  end
    it "exceeded? .TransactionLimitError" do
      3.times { test_client.savings.change_balance(100) }
      expect { test_client.savings.change_balance(100) }.to raise_error(TransactionLimitError)
    end
  end
end