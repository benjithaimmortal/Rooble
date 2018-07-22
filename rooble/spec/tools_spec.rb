require_relative '../lib/rooble.rb'

describe Converter do
  #unit tests
  test_client = Client.new("Test", 100, {checking: 100})
  conversion = test_client.checking.balance.convert_to("EUR")
  context "#convert_to(currency)" do
    it "converts from US cents" do
      expect(test_client.checking.balance.cents).to eq 100
    end
    it "saves as a new currency" do
      expect(conversion).to not_eq Money.new(100)
    end
  end
end