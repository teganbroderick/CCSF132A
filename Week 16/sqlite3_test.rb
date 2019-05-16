#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190516
# FILE: sqlite3_test.rb
# DESC: Week 16 Lab 8: sqlite3 gem program

require 'sqlite3'
require 'digest'
require 'securerandom'

# Create the SQLite3 database and db object
dbfile = "sqlite3.db"
db = SQLite3::Database::new(dbfile)

create_users_table_sql =  <<SQL
CREATE TABLE users (
  id integer primary key,
  name varchar(15) not null,
  email varchar(18) not null unique,
  hashed_password varchar(64) not null,
  password_salt varchar(32) not null)
SQL

begin
  # Check to see if the table exists
  db.execute("DROP TABLE users")
rescue Exception => e
  # If the table is missing we'll end up here. This should happen
  # the first time you run the script.
  puts e.message
  puts "Recreating the USERS table"
end

# Create users table
db.execute(create_users_table_sql)

users = [ # These four records are created for you. You have to add 6 more!
  %w(joe joe@joe.com topsecret1),
  %w(joseph joeseph@joe.com topsecret35),
  %w(tom tom@tom.com topsecret2),
  %w(dick dick@dick.com topsecret3),
  %w(daenerys daenerys@dragonstone.com topsecret4),
  %w(johnsnow johnsnow@thewall.com topsecret5),
  %w(aryastark aryastark@winterfell.com topsecret6),
  %w(sansastark sansa@castleblack.com topsecret7),
  %w(cersei cersei@kingslanding.com topsecret8),
  %w(tyrionlannister tyrion@casterlyrock.com topsecret9)
]

# SQLite has transaction and rollback. We'll uses these features in this script.
# Begin the transaction:
db.execute('BEGIN')

# Try to create the users records.
users.each do |user|

  # The password salt is added to the password to increase complexity
  # We'll create a different salt for every usr
  password_salt = SecureRandom.base64 # it will look something like this: 'asldkfjasd98f798u23kr798d7f'

  # Create hashed password and assign it to users hashed_password field.
  user[2] = Digest::SHA2.hexdigest(user[2] + password_salt)
  begin
    # Try to insert the record into the database.
    db.execute("INSERT INTO users (id,name,email,hashed_password, password_salt) values (null,?,?,?,?)", user << password_salt)
  rescue SQLite3::ConstraintException => e
  # If the INSERT doesn't work for some reason, we end up here.
    puts
    puts "#" * 60
    puts "ERROR: " +  user[1] + " is already in the database."

    # On any failure, rollback and exit. First, you have to clean up the data before you can procede.
    puts "Rolling back to the initial state of the database."
    puts "#" * 60
    db.execute('ROLLBACK')
  end
end

# If we get to here we can commit the data.
db.execute('COMMIT')

# Testing for SELECT
all = db.execute("SELECT * FROM users;")
#output
template = "%2s%25s%30s%70s%35s"
puts template % ["ID","NAME","EMAIL","HASHED_PASSWORD", "PASSWORD_SALT"]

all.each do |i|
  puts template % [i[0],i[1],i[2],i[3],i[4]]
end
__END__
