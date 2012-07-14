class Indexes < ActiveRecord::Migration
  def change
    add_index :memberships, :plan_id
    add_index :memberships, :user_id
    add_index :picks, :place_id
    add_index :picks, :plan_id
  end
end
