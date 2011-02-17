class RemoveTaskId < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :task_id
  end

  def self.down
    add_column :tasks, :task_id, :integer
  end
end
