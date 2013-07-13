class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :email
      t.string :issue
      t.string :subject
      t.text :body
      t.string :unique_reference

      t.timestamps
    end
  end
end
