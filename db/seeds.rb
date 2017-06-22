require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/budget")
require_relative("../models/transaction")
require("pry-byebug")

merchant1 = Merchant.new({
  "name" => "Cloisters"
  })

merchant2 = Merchant.new({
  "name" => "Taquito"
  })

merchant1.save()
merchant2.save()

tag1 = Tag.new({
  "name" => "Drinks"
  })

tag2 = Tag.new({
  "name" => "Food"
  })

tag1.save()
tag2.save()

budget1 = Budget.new({
  "amount" => 1000
  })

budget1.save()

transaction1 = Transaction.new({
  "amount" => 20,
  "merchant_id" => merchant1.merchant_id,
  "tag_id" => tag1.tag_id,
  "date" => Date.new(2017-01-02),
  "budget_id" => budget1.budget_id
  })

transaction2 = Transaction.new({
  "amount" => 7,
  "merchant_id" => merchant2.merchant_id,
  "tag_id" => tag2.tag_id,
  "date" => Date.new(2016-01-02),
  "budget_id" => budget1.budget_id
  })

transaction1.save()
transaction2.save()
