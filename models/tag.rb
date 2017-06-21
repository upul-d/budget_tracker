require_relative("../db/sql_runner")
require_relative("transaction")

class Tag

attr_reader :tag_id
attr_accessor :name 

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

  def self.find(id)
    sql = "SELECT * FROM tags WHERE tag_id = #{id};"
    tag = SqlRunner.run(sql).first
    result = Tag.new(tag)
    return result
  end

  def update()
    sql = "UPDATE tags SET
      name = '#{@name}'
      WHERE tag_id = '#{@tag_id}'"
    SqlRunner.run(sql)
  end
  
end