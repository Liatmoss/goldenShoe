require_relative 'db_connection.rb'
require 'dotenv/load'

class User
  attr_reader :email, :fullname, :password, :id

  def initialize(id:, fullname:, email:, password:)
    @id = id
    @fullname = fullname
    @email = email
    @password = password
  end

  def self.add(fullname:, email:, password:)
    print(ENV["DB_NAME"])
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("INSERT INTO goldenshoe_user (fullname, email, password) VALUES ('#{fullname}', '#{email}', '#{password}') RETURNING id, fullname, email, password;")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.where(id:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("SELECT * FROM GOLDENSHOE_USER WHERE id = #{id};")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(email:, password:)
   DbConnection.setup(ENV["DB_NAME"])
   result = DbConnection.query("SELECT * FROM GOLDENSHOE_USER WHERE email = '#{email}' AND password = '#{password}';")
   return unless result.any?
   User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'], password: result[0]['password'])
 end

end
