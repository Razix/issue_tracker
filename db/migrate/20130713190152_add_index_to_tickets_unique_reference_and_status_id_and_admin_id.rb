class AddIndexToTicketsUniqueReferenceAndStatusIdAndAdminId < ActiveRecord::Migration
  def change
    add_index :tickets, :unique_reference, unique: true
    add_index :tickets, :status_id
    add_index :tickets, :admin_id
  end
end
