class API::V1::BookController < API::V1::BaseController
  def index     
    ##
    # Set the options hash based on params.
    #  
    @options = {id: book_params[:id].to_i, uri: book_params[:url], isbn: book_params[:isbn], eager: eager?}

    ##
    # Extract the requested metadata
    #
    response = Bookshark::Extractor.new(format: @format).book(@options)   

    ##
    # Render json response
    #
    render :json => response
  end

  private

  def book_params
    params.permit(:isbn, :id, :url, :eager)
  end 

  def eager?
    book_params[:eager].present? and book_params[:eager] == "1"
  end
end
