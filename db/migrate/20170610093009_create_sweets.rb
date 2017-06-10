class CreateSweets < ActiveRecord::Migration[5.1]
  def change
    create_table :sweets do |t|
      t.string :sweeter_id
      t.references :swit, foreign_key: true

      t.timestamps
    end
  end
end
