class AddDataToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :commenter_id, :integer
    reversible do |direction|
    	direction.up{
    		change_column :swits, :sours_count, :integer
    	}

    	direction.down{
    		add_column :swits, :sours, :string
    		add_column :swits, :sweets, :string
    	}
    end
  end
end
