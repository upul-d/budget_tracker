require_relative("../db/sql_runner")

class Merchant

attr_reader :merchant_id, :name

  def initialize(options)
    @merchant_id = options["merchant_id"].to_i if options["merchant_id"]
    @name = options["name"]
  end

end