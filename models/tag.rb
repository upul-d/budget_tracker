require_relative("../db/sql_runner")

class Tag

attr_reader :name, :tag_id

def initialize(options)
  @tag_id = options["tag_id"].to_i if options["tag_id"]
  @name = options["name"]
end

end