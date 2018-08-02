#next steps: create a percentage checker, which makes sure all money is vested

#a client template which produces a client number and appropriate accounts based on % of investment
# example = Client.new({
# 	client_demos: "Ben",
# 	investment_cents: 10_000,
# 	balances: {savings: 30, checking: 60, money_market: 10}
# })

class Client
	include AccountManager

	attr_reader :client_demos, :investment_ratio, :account_type, :client_number
	attr_accessor :checking, :savings, :money_market

	def initialize(args)
		@client_demos 		= args[:client_demos]
		@client_number 		= args[:client_number].nil? ? rand(10000..99999) : args[:client_number]
		@investment_cents = args[:investment_cents]
		@investment_ratio	= args[:investment_ratio]

		@investment_ratio.each do |k, v|
			@balance = (v * @investment_cents) / 100
			begin
				self.send("create_#{k.to_s}".to_sym)
			rescue NoMethodError => nme
				puts "Caught #{nme.to_s}"
				raise NoSuchAccountTypeError.new("Account type #{k.to_s} is not valid. " +
										"Valid account types: savings, checking, money_market")
			end
		end
	end

	def create_savings
		@savings 			= Savings.new({client_number: @client_number, balance: @balance})
	end
	def create_checking
		@checking 		= Checking.new({client_number: @client_number, balance: @balance})
	end
	def create_money_market
		@money_market = MoneyMarket.new({client_number: @client_number, balance: @balance})
	end
end