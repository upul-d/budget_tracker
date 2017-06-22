require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction")
require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/budget")
require("pry-byebug")

get "/budget" do
  @budget = Budget.all().first
  @transactions = Transaction.all()
  @total = 0
  for transaction in @transactions
    @total += transaction.amount.to_i
  end
  @balance = @budget.amount.to_i - @total
  erb(:"budgets/index")
end

post "/budget/edit" do
  @budget = Budget.new(params)
  @budget.update()
  redirect to("/")
end