require 'spec_helper'
require_relative '../lib/rooble.rb'


class RoobleTest < Minitest::Test
    def test_puts_hello
        assert_equal "hello test"
            puts "hello test"
    end
    def test_static_client_number
        assert_equal "99998"
            sample = Client.new("Test", 99_999_999, {savings: 40, checking: 30, money_market: 30}, 99998)
            sample.client_number
    end

end