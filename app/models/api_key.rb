class APIKey < ActiveRecord::Base
  belongs_to :user

  # scope :persisted, -> { where "id IS NOT NULL" }

  def self.generate_token    
    loop do      
      token = Devise.friendly_token
      break token unless APIKey.exists?(key: token)
    end       
  end

  def reset_if_needed!
    reset_requests! if needs_reset?
  end

  def needs_reset?
    ((Time.now - last_reset_at).to_i / 1.day) > 0 ? true : false    
  end

  def reset_requests!
    user.update_attribute(:total_requests, user.total_requests + requests_count) if user  
    write_attribute(:requests_count, 0)
    write_attribute(:last_reset_at, Time.now)
  end

  def below_usage_limits?
    reset_if_needed!
    if user
      requests_count < user.max_daily_requests ? true : false
    else
      requests_count < 2500 ? true : false
    end
  end


end
