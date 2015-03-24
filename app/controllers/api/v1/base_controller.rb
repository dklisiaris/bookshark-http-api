class API::V1::BaseController < ApplicationController
  before_action :set_format


  private

  ##
  # Set format to json(minify is enabled) or pretty json (Default is pretty)
  #  
  def set_format  
    @format = (extractor_params[:minify].present? and extractor_params[:minify] == "1") ? 'json' : 'pretty_json'
  end

  def extractor_params
    params.permit(:minify)
  end
end