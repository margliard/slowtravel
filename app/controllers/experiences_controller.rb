class ExperiencesController < ApplicationController
  before_action :set_experience, only: :show

  def index
    @experiences = Experience.all
    # @experiences = policy_scope(Experience)
    @markers = @experiences.geocoded.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude
      }
    end
  end

  def show
    @favorite = Favorite.new
    @review = ReviewExperience.new
    @travelboards = Travelboard.where(user_id: current_user)
    @travelboard = Travelboard.new
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    # authorize @experience
  end
end
