require_relative 'db_connection.rb'
require 'dotenv/load'

class Shoe
  attr_reader :shoe_name, :shoe_size, :shoe_stock, :id, :shoe_colour, :shoe_description

  def initialize(id:, shoe_name:, shoe_stock:, shoe_size:, shoe_colour:, shoe_description:)
    @id = id
    @shoe_name = shoe_name
    @shoe_size = shoe_size
    @shoe_stock = shoe_stock
    @shoe_colour = shoe_colour
    @shoe_size = shoe_size
  end

  def self.all
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_SHOES;")
    result.map do |shoes|
     Shoe.new(id: shoes["id"], shoe_name: shoes["shoe_name"], shoe_colour: shoes["shoe_colour"], shoe_size: shoes["shoe_size"], shoe_description: shoes["shoe_description"], shoe_stock: shoes["shoe_stock"])
     end
  end

  def self.where(shoe_name:, shoe_stock:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_SHOES WHERE shoe_name = '#{shoe_name}' AND shoe_stock = #{shoe_stock};")
    result.map do |shoes|
     Shoe.new(id: shoes["id"], shoe_name: shoes["shoe_name"], shoe_colour: shoes["shoe_colour"], shoe_size: shoes["shoe_size"], shoe_description: shoes["shoe_description"], shoe_stock: shoes["shoe_stock"])
   end
  end

  def self.select(shoe_size:)
    DbConnection.setup(ENV["DB_NAME"])
    p "shoe size input"
    p shoe_size:
    result = DbConnection.query("SELECT id FROM GOLDENSHOE_SHOES WHERE shoe_size = #{shoe_size};")
      result.map do |shoes|
        size = shoes.values_at("id")
        return size.join.to_i
      p "size"
      p size
      p "size as int"
      p size.join.to_i
    end
  end

end
