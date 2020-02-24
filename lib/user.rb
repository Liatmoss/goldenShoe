require_relative 'db_connection.rb'

class User
  attr_reader :email, :fullname, :password, :id

  def initialize(id:, fullname:, email:, password:)
    @id = id
    @fullname = fullname
    @email = email
    @password = password
  end

  def self.add(fullname:, email:, password:)
    DbConnection.setup(ENV["DB_NAME"])
    result = DbConnection.query("INSERT INTO GOLDENSHOE_USER (fullname, email, password) VALUES ('#{fullname}', '#{email}', '#{password}') RETURNING id, fullname, email, password;")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'], password: result[0]['password'])
  end


end
