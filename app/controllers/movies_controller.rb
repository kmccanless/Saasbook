class MoviesController < ApplicationController
  x = Pathname.new('../models/movie_view.rb')
  require_relative x
  def show
    id = params[:id] # retrieve movie ID from URI route
    @model = session[:model]
    @model.movie = MovieView.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
   # debugger
    logger.debug("index")
    logger.debug(params[:sort])
    logger.debug(params[:ratings])
    @model = MovieView.new
    @model.filter = []
    @model.sort = "none"
   # if session[:model].nil?
    #  @model = MovieView.new
     # @model.filter = []
    #else
    #  @model = session[:model]
    #  @model.filter = []
    #end

    if params[:ratings]
      ratings = params[:ratings]
      filter = ratings.keys
      @model.filter = filter
      @model.movies = MovieView.all(:conditions => {:rating  => filter})
      session[:model] = @model
    else
      @model.movies = MovieView.all
      session[:model] = @model
    end
  end

  def sort
    @model = session[:model]
    if params[:sort] == "title"
      logger.debug("title")
      @model.sort = "title"
      @model.movies.sort! { |a,b| a.title <=> b.title}
    elsif params[:sort] == "date"
      logger.debug("date")
      @model.sort = "date"
      @model.movies.sort! { |a,b| a.release_date <=> b.release_date}
    end
    session[:model] = @model
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
