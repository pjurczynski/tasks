class PeopleChangeFilePathName < ActiveRecord::Migration
  def self.up
    change_table :people do |p|
      p.rename :img_path, :img_name
    end
  end

  def self.down
    change_table :people do |p|
      p.rename :img_name, :img_path
    end
  end
end
