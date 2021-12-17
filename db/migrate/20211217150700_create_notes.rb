class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.belongs_to :book
      t.date :date, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
