class CreateRedShifts < ActiveRecord::Migration[5.0]
  def change
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
      t.timestamps
    end
  end
end
