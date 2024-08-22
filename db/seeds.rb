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

Roadmap.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(:roadmaps)

roadmaps = [
  "Frontend",
  "Backend",
  "DevOps",
  "Full Stack",
  "Android",
  "iOS",
  "Ruby on Rails",
]

roadmaps.each do |roadmap|
  Roadmap.create(
    title: roadmap,
    description: "Step by step guide to becoming a modern #{roadmap.downcase} developer in 2024",
  )
end
