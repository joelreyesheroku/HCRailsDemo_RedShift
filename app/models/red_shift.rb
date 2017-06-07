class RedShift < ApplicationRecord

 require 'uri'

  uri = URI.parse(ENV["REDSHIFT"])

  def initialize                                                            
    @conn = PG.connect(                                                                                                        
     port: uri.port,                                                           
     pool: 5,                                                                                                        
     username: uri.user,                                                  
     password: uri.password,                                         
     host: uri.host                                               
    )                                                                       
  end 


end
