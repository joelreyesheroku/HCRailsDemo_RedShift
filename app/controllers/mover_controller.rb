class MoverController < ApplicationController

  def counter
    @Postgres = Account.count
    @Redshift = RedShift.count
  end
  
  def move_to_rs
    pg_accounts = Account.all
   # for a in pg_accounts
   #   RedShift.create!(a.attributes)
   #   puts "moved account #{a.id}"
   #   end
   # RedShift.import pg_accounts, :validate => false, :batch_size => 5000
  end
    
    def clean_redshift
      #need to be able to truncate the table here
    end

end
