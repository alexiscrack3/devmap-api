# frozen_string_literal: true

class AddRoadmapRefToSteps < ActiveRecord::Migration[7.1]
  def change
    add_reference(:steps, :roadmap, null: false, foreign_key: true)
  end
end
