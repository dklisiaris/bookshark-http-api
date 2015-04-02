class API::V1::BaseController < ApplicationController
  before_action :set_format
  before_action :grant_access!


  private

  ##
  # Set format to json(minify is enabled) or pretty json (Default is pretty)
  #  
  def set_format  
    @format = (extractor_params[:minify].present? and extractor_params[:minify] == "1") ? 'json' : 'pretty_json'
  end

  def grant_access!    
    @api_key = APIKey.find_by(key: extractor_params[:key]) if extractor_params[:key].present?

    if @api_key.present? and @api_key.below_usage_limits?
      @api_key.requests_count += 1
      @api_key.last_request_ip = client_ip
      @api_key.save!
    else
      render :json => error_response
    end
  end

  def extractor_params
    params.permit(:minify, :key)
  end

  def client_ip
    request.remote_ip    
  end

  def error_response
    response = {status: 'REQUEST_DENIED'}
    response = JSON.pretty_generate(response)
  end
end