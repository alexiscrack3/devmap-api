# frozen_string_literal: true

class AddUniqueConstraintToTitleColumnOnRoadmapsTable < ActiveRecord::Migration[7.1]
  def change
    add_index(:roadmaps, :title, unique: true)
  end
end
