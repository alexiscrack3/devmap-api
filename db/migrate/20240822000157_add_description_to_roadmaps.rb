# frozen_string_literal: true

class AddDescriptionToRoadmaps < ActiveRecord::Migration[7.1]
  def change
    add_column(:roadmaps, :description, :text)
  end
end
