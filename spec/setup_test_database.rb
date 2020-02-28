require "db_connection"

def setup_test_database
  DbConnection.setup(ENV["DB_NAME"])
  DbConnection.query("TRUNCATE GOLDENSHOE_USER, GOLDENSHOE_ORDERS, GOLDENSHOE_SHOES;")
  add_shoes
  add_user
  add_order
end

def add_shoes
  DbConnection.query("INSERT INTO goldenshoe_shoes (id, shoe_name, shoe_colour, shoe_size, shoe_description, shoe_stock, shoe_price) VALUES ('1', 'heel1', 'black', 4, 'High heel, Round toe, Block heel, Slip on, Upper: Leather, Sole: Rubber, Heel Height: 12 cm, Platform Height: 2.5 cm', 100, 90.00);")
  DbConnection.query("INSERT INTO goldenshoe_shoes (id, shoe_name, shoe_colour, shoe_size, shoe_description, shoe_stock, shoe_price) VALUES ('2', 'heel1', 'black', 5, 'High heel, Round toe, Block heel, Slip on, Upper: Leather, Sole: Rubber, Heel Height: 12 cm, Platform Height: 2.5 cm', 100, 90.00);")
  DbConnection.query("INSERT INTO goldenshoe_shoes (id, shoe_name, shoe_colour, shoe_size, shoe_description, shoe_stock, shoe_price) VALUES ('3', 'heel1', 'black', 6, 'High heel, Round toe, Block heel, Slip on, Upper: Leather, Sole: Rubber, Heel Height: 12 cm, Platform Height: 2.5 cm', 0, 90.00);")
  DbConnection.query("INSERT INTO goldenshoe_shoes (id, shoe_name, shoe_colour, shoe_size, shoe_description, shoe_stock, shoe_price) VALUES ('4', 'heel1', 'black', 7, 'High heel, Round toe, Block heel, Slip on, Upper: Leather, Sole: Rubber, Heel Height: 12 cm, Platform Height: 2.5 cm', 100, 90.00);")
  DbConnection.query("INSERT INTO goldenshoe_shoes (id, shoe_name, shoe_colour, shoe_size, shoe_description, shoe_stock, shoe_price) VALUES ('5', 'heel1', 'black', 8, 'High heel, Round toe, Block heel, Slip on, Upper: Leather, Sole: Rubber, Heel Height: 12 cm, Platform Height: 2.5 cm', 0, 90.00);")
end

def add_user
  DbConnection.query("INSERT INTO goldenshoe_user (id, fullname, email, password) VALUES ('1', 'Liat M', 'liat@test.com', '111111');")
end

def add_order
    DbConnection.query("INSERT INTO goldenshoe_orders (shoe_id, user_id) VALUES ('1', '1');")
end
