require_relative("../db/sql_runner")

class Transaction

  attr_reader :transaction_id
  attr_accessor :amount, :merchant_id, :tag_id, :date

  def initialize(options)
    @amount = options["amount"]
    @transaction_id = options["transaction_id"].to_i if options["transaction_id"]
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
    @date = options["date"]
  end

  def save()
    sql = "INSERT INTO transactions (amount, merchant_id, tag_id, date) VALUES (#{@amount}, #{@merchant_id}, #{@tag_id}, '#{@date}') RETURNING transaction_id"
    transaction = SqlRunner.run(sql).first
    @transaction_id = transaction["transaction_id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def self.transactions_by_tag(passed_tag_id)
    sql = "SELECT * FROM transactions WHERE tag_id = #{passed_tag_id};"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE merchant_id = #{@merchant_id}"
    result = SqlRunner.run(sql).first
    return Merchant.new(result)
  end

  def tag()
      sql = "SELECT * FROM tags WHERE tag_id = #{@tag_id}"
      result = SqlRunner.run(sql).first
      return Tag.new(result)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE transaction_id = #{id};"
    transaction = SqlRunner.run(sql)
    result = Transaction.new(transaction.first)
    return result
  end

  def update()
    sql = "UPDATE transactions SET
      amount = '#{@amount}',
      merchant_id = '#{@merchant_id}',
      tag_id = '#{@tag_id}',
      date = '#{@date}'
      WHERE transaction_id = '#{@transaction_id}'"
    SqlRunner.run(sql)
  end

end