class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :value

      t.timestamps
    end

    Status.create value: 'Waiting for Staff Response'
    Status.create value: 'Waiting for Customer'
    Status.create value: 'On Hold'
    Status.create value: 'Cancelled'
    Status.create value: 'Completed'
  end
end
