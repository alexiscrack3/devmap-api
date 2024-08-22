# frozen_string_literal: true

require "test_helper"

class StatusTest < ActiveSupport::TestCase
  test "#find returns pending status" do
    status = Status.find(1)

    assert_equal "pending", status.value
    assert_equal "Pending", status.display_name
  end

  test "#find returns in_progress status" do
    status = Status.find(2)

    assert_equal "in_progress", status.value
    assert_equal "In Progress", status.display_name
  end

  test "#find returns skip status" do
    status = Status.find(3)

    assert_equal "skip", status.value
    assert_equal "Skip", status.display_name
  end

  test "#find returns done status" do
    status = Status.find(4)

    assert_equal "done", status.value
    assert_equal "Done", status.display_name
  end
end
