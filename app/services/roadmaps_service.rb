# typed: strict
# frozen_string_literal: true

class RoadmapsService < ApplicationService
  sig { returns(T::Array[Roadmap]) }
  def find_all
    Roadmap.all.to_a
  end

  sig { params(id: Integer).returns(Roadmap) }
  def find(id)
    Roadmap
      .includes(steps: [:sections])
      .find(id)
  end

  sig { params(params: T::Hash[Symbol, T.untyped]).returns(Roadmap) }
  def create(params)
    roadmap = Roadmap.new(params)
    roadmap.save!
    roadmap
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error(e.message)
    T.must(roadmap)
  end

  sig { params(id: Integer, params: T::Hash[Symbol, T.untyped]).returns(Roadmap) }
  def update(id, params)
    roadmap = Roadmap.find(id)
    roadmap.update!(params)
    roadmap
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error(e.message)
    roadmap
  end

  sig { params(id: Integer).void }
  def delete(id)
    Roadmap.destroy(id)
  end
end
