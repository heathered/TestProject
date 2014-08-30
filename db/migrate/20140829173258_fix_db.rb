class FixDb < ActiveRecord::Migration
  def down
    drop_table :groomers_users
  end
  
  def up
    create_table :groomers_pets do |t|
      t.integer :groomer_id
      t.integer :pet_id
    end
  end
end
