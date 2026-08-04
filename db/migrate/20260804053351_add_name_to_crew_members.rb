class AddNameToCrewMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :crew_members, :name, :string
  end
end
