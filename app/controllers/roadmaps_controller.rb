# typed: strict
# frozen_string_literal: true

class RoadmapsController < ApplicationController
  # before_action :set_roadmap, only: [:show]

  sig { void }
  def initialize
    super
    @roadmaps_service = T.let(RoadmapsService.new, RoadmapsService)
  end

  # GET /roadmaps
  sig { void }
  def index
    roadmaps = @roadmaps_service.find_all

    render(json: ApiDocument.new(data: roadmaps))
  end

  # GET /roadmaps/1
  sig { void }
  def show
    roadmap = @roadmaps_service.find(roadmap_id_param)
    options = {
      include: {
        steps: {
          include: :sections,
        },
      },
      except: [],
    }

    render(json: ApiDocument.new(data: roadmap.as_json(options)))
  end

  # POST /roadmaps
  sig { void }
  def create
    roadmap = @roadmaps_service.create(roadmap_params.to_h)
    if roadmap.valid?
      render(json: roadmap, status: :created, location: roadmap)
    else
      render(json: roadmap.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /roadmaps/1
  sig { void }
  def update
    roadmap = @roadmaps_service.update(roadmap_id_param, roadmap_params.to_h)
    if roadmap.valid?
      render(json: roadmap)
    else
      render(json: roadmap.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /roadmaps/1
  sig { void }
  def destroy
    @roadmaps_service.delete(roadmap_id_param)
  end

  private

  sig { returns(Integer) }
  def roadmap_id_param
    params[:id].to_i
  end

  # Only allow a list of trusted parameters through.
  sig { returns(ActionController::Parameters) }
  def roadmap_params
    params.require(:roadmap).permit(:title)
  end
end
