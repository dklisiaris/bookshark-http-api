class API::V1::SearchController < API::V1::BaseController
  before_action :prepare_options, only: [:index]

  def index     
    ##
    # Extract the requested metadata
    #        
    response = Bookshark::Extractor.new(format: @format).search(@options)

    ##
    # Render json response
    #
    render :json => response
  end

  private

  def search_params
    params.permit(:title, :author, :publisher, :category, :title_split, :book_id, :isbn, :author_id, :publisher_id, :category_id, :after_year, :before_year, :results_type)
  end

  ##
  # Set the options hash based on given params.
  #  
  def prepare_options
    @options = {}    

    @options[:title]        = search_params[:title]             if search_params[:title].present?
    @options[:author]       = search_params[:author]            if search_params[:author].present?
    @options[:publisher]    = search_params[:publisher]         if search_params[:publisher].present?
    @options[:category]     = search_params[:category]          if search_params[:category].present?
    @options[:title_split]  = search_params[:title_split].to_i  if search_params[:title_split].present?
    @options[:book_id]      = search_params[:book_id].to_i      if search_params[:book_id].present?
    @options[:isbn]         = search_params[:isbn]              if search_params[:isbn].present?
    @options[:author_id]    = search_params[:author_id]         if search_params[:author_id].present?
    @options[:publisher_id] = search_params[:publisher_id].to_i if search_params[:publisher_id].present?
    @options[:category_id]  = search_params[:category_id].to_i  if search_params[:category_id].present?
    @options[:after_year]   = search_params[:after_year].to_i   if search_params[:after_year].present?
    @options[:before_year]  = search_params[:before_year].to_i  if search_params[:before_year].present?
    @options[:results_type] = search_params[:results_type]      if search_params[:results_type].present?
  end
end
