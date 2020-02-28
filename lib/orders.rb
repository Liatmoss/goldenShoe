require_relative 'db_connection.rb'
require 'dotenv/load'

class Orders
  attr_reader :id, :order_date, :shoe_id, :user_id, :guest

  def initialize(id:, order_date:, shoe_id:, user_id:, guest:)
    @id = id
    @order_date = order_date
    @shoe_id = shoe_id
    @user_id = user_id
    @guest = guest
  end

  def self.add(shoe_id:, user_id:)
    result = DbConnection.query("INSERT INTO GOLDENSHOE_ORDERS (shoe_id, user_id) VALUES (#{shoe_id}, #{user_id}) RETURNING id, order_date, shoe_id, user_id, guest;")
    new = Orders.new(id: result[0]['id'], order_date: result[0]['order_date'], shoe_id: result[0]['shoe_id'], user_id: result[0]['user_id'], guest: result[0]['guest'])
  end

  def self.all
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_ORDERS;")
    result.map do |orders|
      Orders.new(id: orders["id"], order_date: orders["order_date"], shoe_id: orders["shoe_id"], user_id: orders["user_id"], guest: orders["guest"])
    end
  end

  def self.user_id(user_id:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_ORDERS WHERE user_id = #{user_id};")
    result.map do |orders|
      Orders.new(id: orders["id"], order_date: orders["order_date"], shoe_id: orders["shoe_id"], user_id: orders["user_id"], guest: orders["guest"])
    end
  end

end
