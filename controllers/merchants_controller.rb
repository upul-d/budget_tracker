require("sinatra")
require("sinatra/contrib/all" )
require_relative("../models/transaction")
require_relative("../models/merchant")
require_relative("../models/tag")
require("pry-byebug")

get "/merchants" do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end