require 'watir'
require 'cucumber'
require 'securerandom'
require 'active_record'

module Database

  def db_connect
    @connection = ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    database: '{db_name}',
    host: '{host_name}',
    username: '{username}',
    password: '{password}',
    ssl_mode: 'disabled'
                    )
  end


  def example_db
    num = customer.text
    customer = num.to_i
    sql = "SELECT EXISTS( SELECT * FROM TabOrders WHERE OrderID = #{customer});"
    @result = @connection.connection.execute(sql)
    @result = @result.each(as: :array)
  end

end