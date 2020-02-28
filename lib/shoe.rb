require_relative 'db_connection.rb'
require 'dotenv/load'

class Shoe
  attr_reader :shoe_name, :shoe_size, :shoe_stock, :id, :shoe_colour, :shoe_description, :shoe_price

  def initialize(id:, shoe_name:, shoe_stock:, shoe_size:, shoe_colour:, shoe_description:, shoe_price:)
    @id = id
    @shoe_name = shoe_name
    @shoe_size = shoe_size
    @shoe_stock = shoe_stock
    @shoe_colour = shoe_colour
    @shoe_size = shoe_size
    @shoe_price = shoe_price
  end

  def self.all
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_SHOES;")
    result.map do |shoes|
     Shoe.new(id: shoes["id"], shoe_name: shoes["shoe_name"], shoe_colour: shoes["shoe_colour"], shoe_size: shoes["shoe_size"], shoe_description: shoes["shoe_description"], shoe_stock: shoes["shoe_stock"], shoe_price: shoes["shoe_price"])
     end
  end

  def self.where(shoe_name:, shoe_stock:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_SHOES WHERE shoe_name = '#{shoe_name}' AND shoe_stock = #{shoe_stock};")
    result.map do |shoes|
     Shoe.new(id: shoes["id"], shoe_name: shoes["shoe_name"], shoe_colour: shoes["shoe_colour"], shoe_size: shoes["shoe_size"], shoe_description: shoes["shoe_description"], shoe_stock: shoes["shoe_stock"], shoe_price: shoes["shoe_price"])
   end
  end

  def self.select(shoe_size:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT id FROM GOLDENSHOE_SHOES WHERE shoe_size = #{shoe_size};")
      result.map do |shoes|
        size = shoes.values_at("id")
        return size.join.to_i
    end
  end

  def self.shoe_order(id:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_SHOES WHERE id = #{id};")
    result.map do |shoes|
     Shoe.new(id: shoes["id"], shoe_name: shoes["shoe_name"], shoe_colour: shoes["shoe_colour"], shoe_size: shoes["shoe_size"], shoe_description: shoes["shoe_description"], shoe_stock: shoes["shoe_stock"], shoe_price: shoes["shoe_price"])
   end
 end

end
