class MoverController < ApplicationController

  def counter
    @Postgres = Account.count
    @Redshift = RedShift.count
  end
  
  def move_to_rs
    pg_accounts = Account.all
    for a in pg_accounts
      RedShift.create!(a.attributes)
      end
    end

end
