class RedShift < ApplicationRecord
  self.table_name = "account"

  uri = URI.parse(ENV["REDSHIFT"])
  establish_connection(
    adapter: "redshift",
    port: uri.port,
    pool: 5,
    username: uri.user,
    password: uri.password,
    host: uri.host
    database: "kevcoredshift"
    )


 # def initialize
   #RedShift.connection(ENV["REDSHIFT"])
   # uri = URI.parse(ENV["REDSHIFT"])
   # @conn = PG.connect(
   # url = uri
    # port: uri.port,
    # pool: 5,
    # username: uri.user,
    # password: uri.password,
    # host: uri.host
    #)
#  end 




end
