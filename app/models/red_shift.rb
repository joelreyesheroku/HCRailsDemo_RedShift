class RedShift < ApplicationRecord
  self.table_name = "account"

  def initialize             
    uri = URI.parse(ENV["REDSHIFT"])                                               
    @conn = PG.connect(                                                                                                        
     port: uri.port,                                                           
     pool: 5,                                                                                                        
     username: uri.user,                                                  
     password: uri.password,                                         
     host: uri.host                                               
    )                                                                       
  end 




end
