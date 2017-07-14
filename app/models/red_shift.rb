class RedShift < ApplicationRecord
  self.table_name = "account"

  uri = URI.parse(ENV["REDSHIFT"])
  establish_connection(
    adapter: "redshift",
    port: uri.port,
    pool: 100,
    username: uri.user,
    password: uri.password,
    host: uri.host,
    database: "kevcoredshift"
    )
    
  def execute_sql(*sql_array)     
    connection.execute(send(:sanitize_sql_array, sql_array))
  end
    
    
  def bulk_load_accounts(accounts)
    puts "starting processing accounts"
    string_accounts = []
    for a in accounts
      temp = ""
      temp << "("
      temp <<  RedShift.sanitize(a.billingstreet.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.name.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.lastmodifieddate.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.id.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.website.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.billingcity.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.createddate.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.fax.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.phone.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.billingstate.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.accountsource.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.billingcountry.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.billingpostalcode.to_s)
      temp << ","
      temp <<  RedShift.sanitize(a.sfid.to_s)
      temp << ")"
      string_accounts << temp
    end
    i = 0
    s_a = ""
    puts "completeded processing accounts, starting bulk load"
    for s in string_accounts
      s_a << s.to_s
      i = i + 1
      if i % 5000 == 0
        sql_statement = "INSERT INTO account (
          billingstreet,
          name,
          lastmodifieddate,
          id,
          website,
          billingcity,
          createddate, 
          fax,
          phone,
          billingstate,
          accountsource,
          billingcountry,
          billingpostalcode,
          sfid) VALUES #{s_a}"
          RedShift.execute_sql(sql_statement)
        s_a = ""
      else
        s_a << ", "
      end
    end
    sql_statement = "INSERT INTO account (
      billingstreet,
      name,
      lastmodifieddate,
      id,
      website,
      billingcity,
      createddate, 
      fax,
      phone,
      billingstate,
      accountsource,
      billingcountry,
      billingpostalcode,
      sfid) VALUES #{s_a.chomp(", ")}"
      RedShift.execute_sql(sql_statement)
      puts "last transactions committed"
    end


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
