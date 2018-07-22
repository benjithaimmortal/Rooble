#next steps: create a percentage checker, which makes sure all money is vested

#a client template which produces a client number and appropriate accounts based on % of investment
#customer = Client.new("Ben", 10_000, {savings: 30, checking: 60, money_market: 10})
class Client
	include Viewer

	def initialize(client_name, deposit, balances, client_number = nil)
		@client_name = client_name
		@client_number = client_number.nil? ? rand(10000..99999) : client_number
		@deposit = deposit
		@balances = balances
		@account_type = nil

		balances.each do |k, v|
			@balance = (v * @deposit) / 100
			@balance = Money.new(@balance, "USD")
			begin
				self.send("create_#{k.to_s}".to_sym)
			rescue NoMethodError => nme
				puts "Caught #{nme.to_s}"
				raise NoSuchAccountTypeError.new("Account type #{k.to_s} is not valid. " +
										"Valid account types: savings, checking, money_market")
			end
		end
	end

	attr_reader :client_name, :balances, :account_type, :client_number
	attr_accessor :checking, :savings, :money_market

	def create_savings
		@savings = Savings.new(@client_name, @client_number, @balance)
	end
	def create_checking
		@checking = Checking.new(@client_name, @client_number, @balance)
	end
	def create_money_market
		@money_market = MoneyMarket.new(@client_name, @client_number, @balance)
	end
end