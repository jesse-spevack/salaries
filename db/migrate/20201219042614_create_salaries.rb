class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.integer :amount, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :current_salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
