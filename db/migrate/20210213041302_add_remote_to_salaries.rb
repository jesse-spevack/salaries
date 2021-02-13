class AddRemoteToSalaries < ActiveRecord::Migration[6.1]
  def change
    add_column :salaries, :remote, :boolean, null: false, default: false
  end
end
