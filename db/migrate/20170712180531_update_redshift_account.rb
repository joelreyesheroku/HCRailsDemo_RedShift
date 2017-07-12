class UpdateRedshiftAccount < ActiveRecord::Migration[5.0]
  def change
    def connection      
      uri = URI.parse(ENV["REDSHIFT"])
      @conn = PG.connect(
      url = uri
      )
    end
    
    drop_table :account
    
    create_table :account do |t|
        t.string   "billingpostalcode", limit: 20
        t.string   "sfid",              limit: 18
        t.string   "_c5_source",        limit: 18
        t.datetime "lastmodifieddate"
        t.string   "website"
        t.string   "billingstreet"
        t.string   "name"
        t.string   "tickersymbol",      limit: 20
        t.string   "billingcity",       limit: 40
        t.boolean  "isdeleted"
        t.string   "phone",             limit: 40
        t.string   "billingstate",      limit: 80
        t.string   "billingcountry",    limit: 80
        t.string "billingstreet", limit: 20
        t.string "name", limit: 255
        t.datetime "lastmodifieddate"
        t.integer "billinglatitude"
        t.integer "id"
        t.string "website", limit: 255
        t.string "billingcity", limit: 40
        t.text "description"
        t.datetime "createddate"
        t.integer "billinglongitude"
        t.string "fax" , limit:40
        t.string "phone", limit: 40
        t.string "_hc_lastop", limit: 32
        t.text "_hc_err"
        t.string "billingstate", limit: 80
        t.boolean "isdeleted"
        t.string "accountsource", limit: 40
        t.string "billingcountry", limit: 80
        t.string "billingpostalcode", limit: 20
        t.string "sfid", limit: 18 
        t.timestamps
      end
    end
end
