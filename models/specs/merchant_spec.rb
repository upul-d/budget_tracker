require("minitest/autorun")
require("minitest/rg")
require_relative("../merchant")

class MerchantTest < Minitest::Test

  def setup
    test_merchant_hash = {"name" => "Machina Espresso", "merchant_id" => 7}
    @merchant = Merchant.new(test_merchant_hash)
  end

  def test_merchant_name
    assert_equal("Machina Espresso", @merchant.name)
  end


end