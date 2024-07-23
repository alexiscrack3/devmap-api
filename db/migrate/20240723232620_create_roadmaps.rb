class CreateRoadmaps < ActiveRecord::Migration[7.1]
  def change
    create_table :roadmaps do |t|
      t.string :title

      t.timestamps
    end
  end
end
