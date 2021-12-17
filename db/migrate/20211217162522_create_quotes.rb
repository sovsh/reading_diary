class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.belongs_to :book
      t.text :text, null: false
      t.timestamps
    end
  end
end
