class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :person_id
      t.text :name
      t.text :img_path

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
