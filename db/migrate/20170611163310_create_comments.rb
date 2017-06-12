class CreateComments < ActiveRecord::Migration[5.1]
  def change
  	drop_table :comments
    create_table :comments do |t|
      t.string :content
      t.references :swit, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
