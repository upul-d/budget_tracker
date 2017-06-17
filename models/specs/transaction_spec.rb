require("minitest/autorun")
require("minitest/rg")
require_relative("../transaction")

class TransactionTest < Minitest::Test

  def setup
    test_transaction_hash = {
      "transaction_id" => 10,
      "merchant_id" => 7, 
      "tag_id" => 8,
      "amount" => 5
    }
    @transaction = Transaction.new(test_transaction_hash)
  end

  def test_transaction_id
    assert_equal(10, @transaction.transaction_id)
  end

  def test_transaction_merchant_id
    assert_equal(7, @transaction.merchant_id)
  end

  def test_transaction_tag_id
    assert_equal(8, @transaction.tag_id)
  end

  def test_transaction_amount
    assert_equal(5, @transaction.amount)
  end

end