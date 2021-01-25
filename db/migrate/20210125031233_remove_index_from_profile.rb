class RemoveIndexFromProfile < ActiveRecord::Migration[6.1]
  def change
    remove_index :profiles, :user_id
  end
end
