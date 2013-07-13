class AddStatusIdAndAdminIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :status_id, :integer
    add_column :tickets, :admin_id, :integer
  end
end
