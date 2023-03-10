class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params[:search])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :search)
  end
end
