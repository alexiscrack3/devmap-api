# frozen_string_literal: true

require "test_helper"

class RoadmapsServiceTest < ActiveSupport::TestCase
  setup do
    @roadmaps_service = RoadmapsService.new
  end

  test "#find_all returns roadmaps" do
    actual = @roadmaps_service.find_all

    assert actual.is_a?(Array)
    assert_equal 2, actual.length
  end

  test "#find returns roadmap when id is found" do
    roadmap = roadmaps(:one)

    actual = @roadmaps_service.find(roadmap.id)

    assert_equal "Frontend", actual.title
  end

  test "#find returns nil when id is not found" do
    assert_raises(ActiveRecord::RecordNotFound) do
      actual = @roadmaps_service.find(100)

      assert_nil actual
    end
  end

  test "#create returns roadmap when valid" do
    params = { title: Faker::ProgrammingLanguage.name }

    assert_difference("Roadmap.count", 1) do
      actual = @roadmaps_service.create(params)

      assert actual.persisted?
      assert actual.valid?
      assert_equal params, actual.as_json(only: params.keys).symbolize_keys
    end
  end

  test "#create returns roadmap with errors when invalid" do
    params = { title: nil }

    assert_difference("Roadmap.count", 0) do
      actual = @roadmaps_service.create(params)

      refute actual.persisted?
      refute actual.valid?
    end
  end

  test "#update returns roadmap when valid" do
    roadmap = roadmaps(:one)
    params = { title: Faker::ProgrammingLanguage.name }

    actual = @roadmaps_service.update(roadmap.id, params)

    assert actual.valid?
    assert_equal params, actual.as_json(only: params.keys).symbolize_keys
  end

  test "#update returns roadmap with errors when invalid" do
    roadmap = roadmaps(:one)
    params = { title: nil }

    actual = @roadmaps_service.update(roadmap.id, params)

    refute actual.valid?
  end

  test "#delete destroys roadmap" do
    roadmap = roadmaps(:one)

    assert_difference("Roadmap.count", -1) do
      @roadmaps_service.delete(roadmap.id)
    end
  end
end
