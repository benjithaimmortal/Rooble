#next steps: create a percentage checker, which makes sure all money is vested

#a client template which produces a client number and appropriate accounts based on % of investment
# example = Client.new({
# 	client_demos: "Ben",
# 	investment_cents: 10_000,
# 	investment_ratio: {savings: 30, checking: 60, money_market: 10}
# })

class Client
	include AccountManager
	attr_reader :client_demos, :investment_cents, :investment_ratio, :client_number

	def initialize(args)
		@client_number 		= args.fetch(:client_number, rand(10000..99999))
		@client_demos 		= args[:client_demos]
		@investment_cents = args[:investment_cents]
		@investment_ratio	= args[:investment_ratio]

		@accounts = register({investment_cents: @investment_cents, investment_ratio: @investment_ratio})

	end
end