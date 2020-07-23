
DB = {:conn => SQLite3::Database.new("./db/development.sqlite")}


sql = <<-SQL 
INSERT INTO "users" VALUES (1,'nroulston','$2a$12$s/VTGhGrkVy6AESitlBr3uUNb8XgRjKq8orbcI5dQDUKUGj2kydsO','2020-07-18 03:00:51.689098','2020-07-18 03:00:51.689098');

SQL



DB[:conn].execute_batch(sql)