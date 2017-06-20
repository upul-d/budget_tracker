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

get "/merchants/new" do
  @merchants = Merchant.all()
  erb(:"merchants/new")
end

post "/merchants/new" do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:"merchants/create")
end