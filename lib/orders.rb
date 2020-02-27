require_relative 'db_connection.rb'
require 'dotenv/load'

class Orders
  attr_reader :id, :order_date, :shoe_id, :user_id

  def initialize(id:, order_date:, shoe_id:, user_id:, guest:)
    @id = id
    @order_date = order_date
    @shoe_id = shoe_id
    @user_id = user_id
    @guest = guest
  end

  def self.add(order_date:, shoe_id:, user_id:, guest:)
    result = DbConnection.query("INSERT INTO orders (order_date, shoe_id, user_id, guest) VALUES ('#{order_date}', '#{shoe_id}', '#{user_id}', '#{guest}') RETURNING id, name, description, price, start_date, end_date, owner_id, guest;")
    Orders.new(id: result[0]['id'], order_date: result[0]['order_date'], shoe_id: result[0]['shoe_id'], user_id: result[0]['user_id'], guest: result[0]['guest'])
  end

  def self.all
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM ORDERS;")
    result.map do |orders|
      Orders.new(id: orders["id"], orer_date: orders["order_date"], shoe_id: orders["shoe_id"], user_id: orders["user_id"], guest: orders["guest"])
    end
  end

end
