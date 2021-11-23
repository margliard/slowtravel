class ExperiencesController < ApplicationController
  before_action :set_experience, only: :show

  def index
    @experiences = Experience.all
    # @experiences = policy_scope(Experience)
  end

  def show
    @favorite = Favorite.new
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    # authorize @experience
  end
end
