require_relative '../lib/rooble.rb'

describe Rooble do
  let(:test_client) { Client.new({
    client_demos: "Test",
    investment_cents: 100,
    investment_ratio: {savings: 100}
  }) }

  let(:test_client2) { Client.new({investment_cents: 1, investment_ratio: {saving: 100}}) }


  context "incorrect #account_type?" do
    it ".NoSuchAccountTypeError" do
#!      expect(test_client2).to raise_error(NoSuchAccountTypeError)
    end
  end
end