class APIKey < ActiveRecord::Base
  belongs_to :user

  def self.generate_token
    SecureRandom.hex(32)    
  end

  def reset_if_needed!
    reset_requests! if needs_reset?
  end

  def needs_reset?
    ((Time.now - last_reset_at).to_i / 1.day) > 0 ? true : false    
  end

  def reset_requests!
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
