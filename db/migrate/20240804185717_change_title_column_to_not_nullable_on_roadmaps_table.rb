# frozen_string_literal: true

class ChangeTitleColumnToNotNullableOnRoadmapsTable < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:roadmaps, :title, false)
  end
end
