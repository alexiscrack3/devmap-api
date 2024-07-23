require "test_helper"

class RoadmapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roadmap = roadmaps(:one)
  end

  test "should get index" do
    get roadmaps_url, as: :json
    assert_response :success
  end

  test "should create roadmap" do
    assert_difference("Roadmap.count") do
      post roadmaps_url, params: { roadmap: { title: @roadmap.title } }, as: :json
    end

    assert_response :created
  end

  test "should show roadmap" do
    get roadmap_url(@roadmap), as: :json
    assert_response :success
  end

  test "should update roadmap" do
    patch roadmap_url(@roadmap), params: { roadmap: { title: @roadmap.title } }, as: :json
    assert_response :success
  end

  test "should destroy roadmap" do
    assert_difference("Roadmap.count", -1) do
      delete roadmap_url(@roadmap), as: :json
    end

    assert_response :no_content
  end
end
