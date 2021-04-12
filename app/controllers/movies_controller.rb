class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:actor_id])
    @movie = Movie.find(params[:id])
    @movie_credits = MovieCredit.create(actor: @actor, movie: @movie)

    redirect_to "/movies/#{@movie.id}"
  end
end
