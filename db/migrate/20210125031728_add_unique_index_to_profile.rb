class AddUniqueIndexToProfile < ActiveRecord::Migration[6.1]
  def change
    add_index :profiles, :user_id, unique: true
  end
end
