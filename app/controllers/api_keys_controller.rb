class APIKeysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key, only: [:destroy]

  respond_to :html

  # GET /api_keys
  # GET /api_keys.json
  def index
    @api_keys = current_user.api_keys.persisted
    @api_key = current_user.api_keys.new   
  end


  # POST /api_keys
  # POST /api_keys.json
  def create
    @api_key = current_user.api_keys.new(api_key_params)
    set_initial_defaults(@api_key)

    flash[:notice] = "API key was successfully created." if @api_key.save
    redirect_to api_keys_url
  end

  # DELETE /api_keys/1
  # DELETE /api_keys/1.json
  def destroy
    @api_key.destroy
    flash[:notice] = "API key was successfully destroyed."
    redirect_to api_keys_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_key
      @api_key = APIKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_key_params
      params.require(:api_key).permit(:name)
    end

    def set_initial_defaults(api_key)
      api_key.key = APIKey.generate_token    
      api_key.requests_count = 0
      api_key.last_reset_at = Time.now
    end

end
