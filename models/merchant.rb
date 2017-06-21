require_relative("../db/sql_runner")

class Merchant

attr_reader :merchant_id, :name

  def initialize(options)
    @merchant_id = options["merchant_id"].to_i if options["merchant_id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING merchant_id"
    merchant = SqlRunner.run(sql).first
    @merchant_id = merchant["merchant_id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants;"
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE merchant_id = #{id};"
    merchant = SqlRunner.run(sql).first
    result = Merchant.new(merchant)
    return result
  end

  def update()
    sql = "UPDATE merchants SET
      name = '#{@name}'
      WHERE tag_id = '#{@merchant_id}'"
    SqlRunner.run(sql)
  end


end