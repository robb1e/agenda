class AddFoursquareAuth < ActiveRecord::Migration
  def change
    add_index :users, :foursquare_id
  end
end
