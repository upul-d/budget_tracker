require_relative("../db/sql_runner")
require_relative("transaction")

class Tag

attr_reader :name, :tag_id

  def initialize(options)
    @tag_id = options["tag_id"].to_i if options["tag_id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING tag_id"
    tag = SqlRunner.run(sql).first
    @tag_id = tag["tag_id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    result = tags.map { |tag| Tag.new(tag) }
    return result
  end
  
end