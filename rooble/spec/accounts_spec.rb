require_relative '../lib/rooble.rb'

describe Rooble do
  #unit tests
  let(:test_percent) { rand(1..100) }
  let!(:test_client) do 
    Client.new({
      investment_cents: 100,
      investment_ratio: {savings: test_percent, checking: (100-test_percent)}
    })
  end
  

  context "many #accounts" do
    it "gives correct percentages to each" do
      expect(test_client.savings.balance).to eq (test_percent)
      expect(test_client.checking.balance).to eq (100-test_percent)
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