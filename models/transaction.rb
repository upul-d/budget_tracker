require_relative("../db/sql_runner")

class Transaction

  attr_reader :transaction_id, :merchant_id, :tag_id, :amount 

  def initialize(options)
    @transaction_id = options["transaction_id"].to_i if options["transaction_id"]
    @merchant_id = options["merchant_id"]
    @tag_id = options["tag_id"]
    @amount = options["amount"]
  end

end