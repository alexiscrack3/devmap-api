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

Step.destroy_all
Roadmap.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(:steps)
ActiveRecord::Base.connection.reset_pk_sequence!(:roadmaps)

roadmaps = [
  {
    title: "Frontend",
    steps: [],
  },
  {
    title: "Backend",
    steps: [
      {
        title: "Internet",
      },
      {
        title: "Pick a language",
      },
      {
        title: "Version Control Systems",
      },
      {
        title: "Repo Hosting Services",
      },
      {
        title: "Relational Databases",
      },
      {
        title: "Learn About APIs",
      },
      {
        title: "Caching",
      },
      {
        title: "Web Security",
      },
      {
        title: "Testing",
      },
      {
        title: "CI/CD",
      },
    ],
  },
  {
    title: "DevOps",
    steps: [],
  },
  {
    title: "Ruby on Rails",
    steps: [],
  },
]

roadmaps.each do |roadmap|
  title = roadmap[:title]
  new_roadmap = Roadmap.create!(
    title:,
    description: "Step by step guide to becoming a modern #{title.downcase} developer in 2024",
  )
  roadmap[:steps].each do |step|
    Step.create!(
      title: step[:title],
      roadmap: new_roadmap,
    )
  end
end
