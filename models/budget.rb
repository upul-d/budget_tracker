require_relative("../db/sql_runner")

class Budget

  attr_reader :budget_id
  attr_accessor :amount

  def initialize(options)
    @amount = options["amount"]
    @budget_id = options["budget_id"].to_i if options["budget_id"]
  end

  def save()
    sql = "INSERT INTO budgets (amount) VALUES (#{@amount}) RETURNING budget_id"
    budget = SqlRunner.run(sql).first
    @budget_id = budget["budget_id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM budgets;"
    budgets = SqlRunner.run(sql)
    result = budgets.map { |budget| Budget.new(budget) }
    return result
  end

  def update()
    sql = "UPDATE budgets SET
      amount = '#{@amount}'
      WHERE budget_id = '#{@budget_id}'"
    SqlRunner.run(sql)
  end

end