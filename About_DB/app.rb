require 'sqlite3'
  db = SQLite3::Database.new 'test.sqlite3'

  db.execute "INSERT INTO Cars (Name, Price) VALUES ('Jaguar', 777777)"

  db.execute "SELECT * FROM Cars" do |car|
    puts car
    puts "==="
  end

  db.close

puts 'Ok'
