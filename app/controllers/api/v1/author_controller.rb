class API::V1::AuthorController < API::V1::BaseController
  def index     
    ##
    # Set the options hash based on params.
    #  
    @options = {id: author_params[:id].to_i, uri: author_params[:url]}

    ##
    # Extract the requested metadata
    #        
    response = Bookshark::Extractor.new(format: @format).author(@options)   

    ##
    # Render json response
    #
    render :json => response
  end

  private

  def author_params
    params.permit(:id, :url)
  end
end
