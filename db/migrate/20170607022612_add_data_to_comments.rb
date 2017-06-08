class AddDataToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :commenter_id, :integer
    change_column :swits, :sours_count, :integer
  end
end
