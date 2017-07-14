class MoverController < ApplicationController

  def counter
    @Postgres = Account.count
    @Redshift = RedShift.count
  end
  
  def move_to_rs
    pg_accounts = Account.all
    RedShift.bulk_load_accounts(pg_accounts)
 end
    
  def clean_redshift
    RedShift.connection.insert("TRUNCATE TABLE ACCOUNT")
  end

end



