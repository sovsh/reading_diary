class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.belongs_to :user
      t.string :picture_link
      t.string :author
      t.string :title, null: false
      t.integer :status, default: 0
      t.date :started, null: false
      t.date :finished
      t.text :review
      t.integer :score, default: 0
      t.timestamps
    end
  end
end
