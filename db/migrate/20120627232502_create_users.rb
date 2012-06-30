class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :foursquare_id
      t.string :foursquare_token
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :avatar
      t.timestamps
    end
  end
end
