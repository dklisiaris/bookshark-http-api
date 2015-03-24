class API::V1::PublisherController < API::V1::BaseController
  def index     
    ##
    # Set the options hash based on params.
    #  
    @options = {id: publisher_params[:id].to_i, uri: publisher_params[:url]}

    ##
    # Extract the requested metadata
    #
    response = Bookshark::Extractor.new(format: @format).publisher(@options)   

    ##
    # Render json response
    #
    render :json => response
  end

  private

  def publisher_params
    params.permit(:id, :url)
  end
end
