require 'money'
require 'money/bank/open_exchange_rates_bank'

module Converter
  oxr = Money::Bank::OpenExchangeRatesBank.new
  oxr.app_id = 'fc158def68a6437aba6eafa19f4f847b'
  oxr.ttl_in_seconds = 86400

  oxr.cache = Proc.new do |v|
    key = 'money:exchange_rates'
    if v
      Thread.current[key] = v
    else
      Thread.current[key]
    end
  end

  Money.default_bank = oxr
  oxr.update_rates


  def money
    @balance = Money.new(@balance, "USD")
  end

  def convert_to(currency)
    @balance = Money.new(@balance, "USD")
    @balance.exchange_to(currency)
  end
end