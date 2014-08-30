class DropGroomersUsers < ActiveRecord::Migration
  def down
    drop_table :groomers_users
  end
end
