# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "frozen_record/test_helper"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    setup do
      test_fixtures_base_path = Rails.root.join("test/support/fixtures")
      FrozenRecord::TestHelper.load_fixture(Status, test_fixtures_base_path)
    end

    teardown do
      FrozenRecord::TestHelper.unload_fixtures
    end
  end
end
