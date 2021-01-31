class AddLocationToSalaries < ActiveRecord::Migration[6.1]
  def change
    add_reference :salaries, :location, foreign_key: true
  end
end
