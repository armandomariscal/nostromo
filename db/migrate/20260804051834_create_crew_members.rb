class CreateCrewMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :crew_members do |t|
      t.timestamps
    end
  end
end
