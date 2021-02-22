class AddProgramToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :program, :string
  end
end
