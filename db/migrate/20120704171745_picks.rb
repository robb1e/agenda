class Picks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :place_id
      t.integer :plan_id
      t.datetime :from
      t.datetime :until
      t.timestamps
    end
  end
end
