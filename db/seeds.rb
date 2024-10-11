# typed: true
# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

SubSection.destroy_all
Section.destroy_all
Step.destroy_all
Roadmap.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:sub_sections)
ActiveRecord::Base.connection.reset_pk_sequence!(:sections)
ActiveRecord::Base.connection.reset_pk_sequence!(:steps)
ActiveRecord::Base.connection.reset_pk_sequence!(:roadmaps)

RoadmapRecord.each do |roadmap_record|
  title = roadmap_record.title
  new_roadmap = Roadmap.create!(
    title:,
    description: "Step by step guide to becoming a modern #{title.capitalize} expert in #{Time.now.utc.year}",
  )
  steps = roadmap_record.steps || []
  steps.each do |step_record|
    new_step = Step.create!(
      title: step_record["title"],
      roadmap: new_roadmap,
    )

    sections = step_record["sections"] || []
    sections.each do |section_record|
      new_section = Section.create!(
        title: section_record["title"],
        step: new_step,
      )

      subsections = section_record["sub_sections"] || []
      subsections.each do |subsection_record|
        SubSection.create!(
          title: subsection_record,
          section: new_section,
        )
      end
    end
  end
end
