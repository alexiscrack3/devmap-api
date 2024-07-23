# frozen_string_literal: true

class RoadmapsController < ApplicationController
  before_action :set_roadmap, only: [:show, :update, :destroy]

  # GET /roadmaps
  def index
    @roadmaps = Roadmap.all

    render(json: @roadmaps)
  end

  # GET /roadmaps/1
  def show
    render(json: @roadmap)
  end

  # POST /roadmaps
  def create
    @roadmap = Roadmap.new(roadmap_params)

    if @roadmap.save
      render(json: @roadmap, status: :created, location: @roadmap)
    else
      render(json: @roadmap.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /roadmaps/1
  def update
    if @roadmap.update(roadmap_params)
      render(json: @roadmap)
    else
      render(json: @roadmap.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /roadmaps/1
  def destroy
    @roadmap.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_roadmap
    @roadmap = Roadmap.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def roadmap_params
    params.require(:roadmap).permit(:title)
  end
end
