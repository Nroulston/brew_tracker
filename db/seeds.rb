
DB = {:conn => SQLite3::Database.new("./db/development.sqlite")}


sql = <<-SQL 


SQL



DB[:conn].execute_batch(sql)