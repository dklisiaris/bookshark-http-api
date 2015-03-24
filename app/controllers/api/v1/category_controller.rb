class API::V1::CategoryController < API::V1::BaseController
  def index     
    ##
    # Set the options hash based on params.
    #  
    @options = {id: category_params[:id].to_i, uri: category_params[:url]}

    ##
    # Extract the requested metadata
    #
    response = Bookshark::Extractor.new(format: @format).category(@options)   

    ##
    # Render json response
    #
    render :json => response
  end

  private

  def category_params
    params.permit(:id, :url)
  end
end
