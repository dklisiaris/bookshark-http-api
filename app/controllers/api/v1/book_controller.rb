class API::V1::BookController < ApplicationController
  def index     
    if params['id'].present?
      response = Bookshark::Extractor.new(format: 'pretty_json').book(id: params['id'].to_i)  
    else
      response = {error_message: "Invalid request. Missing the 'id' parameter.", status: "REQUEST_DENIED"}
      response = JSON.pretty_generate(response)
    end
           
    render :json => response
  end
end
