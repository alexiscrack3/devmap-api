# frozen_string_literal: true

require "test_helper"

class RoadmapTest < ActiveSupport::TestCase
  test "should save roadmap with title" do
    roadmap = Roadmap.new(title: Faker::ProgrammingLanguage.name)

    roadmap.save!

    assert roadmap.persisted?
  end

  test "should not save roadmap without title" do
    roadmap = Roadmap.new(title: nil)

    assert_raises ActiveRecord::RecordInvalid do
      roadmap.save!

      refute roadmap.persisted?
    end
  end

  test "should not save roadmap with duplicate title" do
    title = Faker::ProgrammingLanguage.name
    Roadmap.create(title: title)

    assert_raises ActiveRecord::RecordInvalid do
      Roadmap.create!(title: title)
    end
  end
end
