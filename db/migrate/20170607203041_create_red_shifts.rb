class CreateRedShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :red_shifts do |t|

      t.timestamps
    end
  end
end
