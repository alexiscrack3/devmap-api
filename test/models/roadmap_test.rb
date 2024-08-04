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
end
