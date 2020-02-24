require "db_connection"

def setup_test_database
  DbConnection.setup(ENV["DB_NAME"])
  DbConnection.query("TRUNCATE GOLDENSHOE_USER;")
  # add_listings
end

# def add_listings
#   DbConnection.query("INSERT INTO rubynb_user (id, email, password) VALUES ('1', 'alistairphipps@gmail.com', 'password');")
#   DbConnection.query("INSERT INTO listings (id, name, description, price, start_date, end_date, owner_id) VALUES ('1', 'Hotel California',
#    'A lovely place to stay with lots of nice things like wifi and snacks', '1000.00', '2019-11-23', '2019-11-30', 1);")
# end
