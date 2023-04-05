class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :search)
  end
end
