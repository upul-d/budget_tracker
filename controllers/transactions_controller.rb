require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction")
require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/budget")
require("pry-byebug")

get "/transactions" do
  @transactions = Transaction.all()
  @total = 0
  for transaction in @transactions
    @total += transaction.amount.to_i
  end
  @tags = Tag.all()
  erb(:"transactions/index")
end

get "/transactions/bytag/:tag_id" do
  @transactions = Transaction.transactions_by_tag(params[:tag_id])
  @total = 0
  for transaction in @transactions
    @total += transaction.amount.to_i
  end
  @tags = Tag.all()
  erb(:"transactions/bytag")
end

get "/transactions/new" do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

post "/transactions/new" do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transactions/create")
end


get "/transactions/edit/:transaction_id" do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transaction = Transaction.find(params[:transaction_id])
  erb(:"transactions/edit")
end

post "/transactions/edit/:transaction_id" do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect to("/transactions")
end

post "/transactions/delete/:transaction_id" do
  transaction = Transaction.find(params[:transaction_id])
  transaction.delete()
  redirect to("/transactions")
end


