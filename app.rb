require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("controllers/merchants_controller")
require_relative("controllers/tags_controller")
require_relative("controllers/transactions_controller")
require_relative("controllers/budgets_controller")


get "/" do
  @budget = Budget.all().first
  @transactions = Transaction.all()
  @total = 0
  for transaction in @transactions
    @total += transaction.amount.to_i
  end
  @balance = @budget.amount.to_i - @total
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:index)
end