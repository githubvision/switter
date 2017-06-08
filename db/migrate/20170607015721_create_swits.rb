class CreateSwits < ActiveRecord::Migration[5.1]
  def change
    create_table :swits do |t|
      t.text :post
      t.integer :sweets_count
      t.string :sours_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
