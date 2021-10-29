class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show ]
  before_action :parse_search_query, only: [:search]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  def search
    @projects = Project.filter(params.slice(:all))
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def parse_search_query
      search_query = params[:query]
      if search_query.present?
        params[:all] = search_query.split(",").map do |term|
          term.strip
        end
      end
    end
end
