class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :reply
      t.references :ticket
      t.references :admin

      t.timestamps
    end
    add_index :comments, :ticket_id
    add_index :comments, :admin_id
  end
end
