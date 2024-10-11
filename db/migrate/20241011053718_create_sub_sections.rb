class CreateSubSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_sections do |t|
      t.string :title
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
