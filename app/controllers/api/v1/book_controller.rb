class API::V1::BookController < API::V1::BaseController
  def index     
    ##
    # Set the options hash based on params.
    #  
    @options = {id: book_params[:id].to_i, uri: book_params[:url]}

    ##
    # Extract the requested metadata
    #
    puts Bookshark::Extractor.new(format: 'pretty_json').book(id: 300000000)
    puts @options
    response = Bookshark::Extractor.new(format: @format).book(@options)   

    ##
    # Render json response
    #
    render :json => response
  end

  private

  def book_params
    params.permit(:id, :url)
  end 
end
