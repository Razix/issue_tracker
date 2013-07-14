class AddIndexToStatusesValue < ActiveRecord::Migration
  def change
    add_index :statuses, :value, unique: true
  end
end
