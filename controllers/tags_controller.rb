require("sinatra")
require("sinatra/contrib/all" )
require_relative("../models/transaction")
require_relative("../models/merchant")
require_relative("../models/tag")
require("pry-byebug")

get "/tags" do
  @tags = Tag.all()
  erb(:"tags/index")
end