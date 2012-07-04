class Places < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :foursquare_id
      t.timestamps
    end
  end
end
