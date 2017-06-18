require_relative("../db/sql_runner")
require("pry-byebug")

class Transaction

  attr_reader :amount, :transaction_id, :merchant_id, :tag_id 

  def initialize(options)
    @amount = options["amount"]
    @transaction_id = options["transaction_id"].to_i if options["transaction_id"]
    @merchant_id = options["merchant_id"]
    @tag_id = options["tag_id"]
  end

  def save()
    sql = "INSERT INTO transactions (amount, merchant_id, tag_id) VALUES (#{@amount}, #{@merchant_id}, #{@tag_id}) RETURNING transaction_id"
    transaction = SqlRunner.run(sql).first
    @transaction_id = transaction["transaction_id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

end