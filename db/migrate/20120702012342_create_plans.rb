class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.datetime :from
      t.timestamps
    end
  end
end
