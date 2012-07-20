class CreateInvitation < ActiveRecord::Migration
  def change
  	create_table :invitations do |t|
  		t.string :invite_code
  		t.integer :user_id
  		t.integer :plan_id
  		t.timestamps
  	end
  end
end
