class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :task_id
      t.integer :person_id
      t.text :desc
      t.boolean :active
      t.date :date_start
      t.date :date_finish

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
