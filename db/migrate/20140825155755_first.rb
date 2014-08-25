class First < ActiveRecord::Migration
  def change
    
    # CREATE TABLE appts (id INTEGER PRIMARY KEY, groomer_id INT, pet_id INT, date DATETIME);
    # CREATE TABLE groomers (id INTEGER PRIMARY KEY, name VARCHAR(30));
    # CREATE TABLE groomers_pets (groomer_id INT, pet_id INT);
    # CREATE TABLE notes (id INTEGER PRIMARY KEY, appt_id INT, note TEXT);
    # CREATE TABLE pets (id integer primary key, name varchar(30));
  
    create_table :appts do |t|
      t.integer :groomer_id
      t.integer :pet_id
      t.datetime :date
    end

    create_table :groomers do |t|
      t.string :name
    end

    create_table :groomers_users do |t|
      t.integer :groomer_id
      t.integer :pet_id
    end

    create_table :notes do |t|
      t.integer :appt_id
      t.text :note
    end

    create_table :pets do |t|
      t.string :name
    end
  end
end    
