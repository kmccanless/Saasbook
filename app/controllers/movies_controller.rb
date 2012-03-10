class MoviesController < ApplicationController
  x = Pathname.new('../models/movie_view.rb')
  require_relative x
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
   # debugger
    logger.debug("index")
    logger.debug(params[:sort])
    logger.debug(params[:ratings])
    @model = MovieView.new
    if params[:ratings]
      ratings = params[:ratings]
      filter = ratings.keys
      session[:filter] = filter
      @model.movies = MovieView.all(:conditions => {:rating  => session[:filter]})
    else
      session[:filter] = nil
      @model.movies = MovieView.all
    end
    if params[:sort] == "title"
      logger.debug("title")
      @model = MovieView.new
      @model.sort = "title"
      @model.movies = MovieView.all(:conditions => {:rating  => "PG"})
      @model.movies.sort_by { |m| m.title}
    elsif params[:sort] == "date"
      logger.debug("date")
      @model = MovieView.new
      @model.sort = "date"
      @model.movies = MovieView.order("release_date")
    end
  end

  def filter
   # debugger
    ratings = params[:ratings]
    filter = ratings.keys
    @model = MovieView.new
    @model.filter = filter
    @model.movies = MovieView.all(:conditions => {:rating  => filter})
    render "index"
  end

  def sort
    if params[:sort] == "title"
      logger.debug("title")
      @model = MovieView.new
      @model.sort = "title"
      @model.movies = MovieView.order("title")
    elsif params[:sort] == "date"
      logger.debug("date")
      @model = MovieView.new
      @model.sort = "date"
      @model.movies = MovieView.order("release_date")
    end
    render "index"
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
