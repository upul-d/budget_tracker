require("sinatra")
require("sinatra/contrib/all" )
require_relative("../models/transaction")
require_relative("../models/merchant")
require_relative("../models/tag")
require("pry-byebug")

get "/transactions" do
  @transactions = Transaction.all()
  erb(:"transactions/index")
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