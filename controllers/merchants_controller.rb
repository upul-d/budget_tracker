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

post "/merchants" do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:"merchants/create")
end

get "/merchants/edit/:merchant_id" do
  @merchant = Merchant.find(params[:merchant_id])
  erb(:"merchants/edit")
end

post "/merchants/edit/:merchant_id" do
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect to("/merchants")
end