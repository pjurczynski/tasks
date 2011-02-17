class Task_manager < ActiveRecord::Base
  has_one :person
  has_many :tasks, :through => :person
end
