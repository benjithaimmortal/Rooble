# describe Converter do
#   let(:test_client) do
#     Client.new({
#       investment_cents: 100,
#       investment_ratio: {checking: 100}
#     })
#   end

#   context ".money?" do
#     it "converts #balance to #RubyMoney" do
#       expect(test_client.checking.money).to eq Money.new(100, "USD")
#     end
#   end

#   context ".convert_to" do
#     it "converts to #RubyMoney::[currency]" do
#       expect(test_client.checking.convert_to("EUR")).to eq 
#                       Money.new(100, "USD").exchange_to("EUR")
#     end
#   end
# end