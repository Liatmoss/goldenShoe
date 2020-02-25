require_relative 'db_connection.rb'
require 'dotenv/load'

class Shoe
  attr_reader :shoe_name, :shoe_size, :shoe_stock, :id

  def initialize(id:, shoe_name:, shoe_stock:, shoe_size:)
    @id = id
    @shoe_name = shoe_name
    @shoe_size = shoe_size
    @shoe_stock = shoe_stock
  end

  def self.all
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_SHOE;")
    result.map do |shoes|
     Shoe.new(id: shoes["id"], shoe_name: shoes["shoe_name"], shoe_colour: shoes["shoe_colour"], shoe_size: shoes["shoe_size"], shoe_description: shoes["shoe_description"], shoe_stock: shoes["shoe_stock"])
     end
  end
end
