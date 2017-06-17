require("minitest/autorun")
require("minitest/rg")
require_relative("../tag")

class TagTest < Minitest::Test

  def setup
    test_tag_hash = {"name" => "Food", "tag_id" => 8}
    @tag = Tag.new(test_tag_hash)  
  end

  def test_tag_name
    assert_equal("Food", @tag.name)
  end

  def test_tag_id
    assert_equal(8, @tag.tag_id)
  end

end