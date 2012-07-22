class InviteIndexes < ActiveRecord::Migration
  def change
    add_index :invitations, :user_id
    add_index :invitations, :plan_id
    add_index :memberships, [:user_id, :plan_id], unique: true
  end
end
