require("sinatra")
require("sinatra/contrib/all" )
require_relative("../models/transaction.rb")
require("pry-byebug")

get "/transactions" do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end