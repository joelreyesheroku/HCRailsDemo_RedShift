class RedShift < ApplicationRecord
  self.table_name = "account"

 # def initialize
   RedShift.connection(ENV["REDSHIFT"])
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
