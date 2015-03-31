class APIKey < ActiveRecord::Base
  belongs_to :user

  def set_initial_defaults
    key = APIKey.generate_token    
    requests_count = 0
    last_reset_at = Time.now
  end

  def self.generate_token
    SecureRandom.hex(32)    
  end
end
