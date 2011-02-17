class RemovePersonId < ActiveRecord::Migration
  def self.up
    remove_column :people, :person_id
  end

  def self.down
    add_column :people, :person_id, :integer
  end
end
