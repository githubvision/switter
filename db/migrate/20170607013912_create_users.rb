class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.date :birthday
      t.string :bio

      t.timestamps
    end
  end
end
