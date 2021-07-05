class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :ticket_title
      t.string :ticket_number
      t.date :due_date
      t.text :ticket_notes

      t.timestamps
    end
  end
end
