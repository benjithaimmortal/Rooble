require 'money'
require 'money/bank/open_exchange_rates_bank'

oxr = Money::Bank::OpenExchangeRatesBank.new
oxr.app_id = 'fc158def68a6437aba6eafa19f4f847b'

oxr.ttl_in_seconds = 86400
Money.default_bank = oxr

module Converter
  def money
    @balance = Money.new(@balance, "USD")
  end

  def convert_to(currency)
    @balance = @balance.exchange_to("#{currency}")
  end
end