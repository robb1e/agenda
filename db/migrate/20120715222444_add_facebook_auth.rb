class AddFacebookAuth < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :string, null: true
    add_column :users, :facebook_token, :string, null: true
    add_index :users, :facebook_id
  end
end
