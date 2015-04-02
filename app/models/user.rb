class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :api_keys, :dependent => :destroy

  enum level: %i(registered gold platinum)

  def reached_limit?
    api_keys.count <= 10 ? false : true
  end

  def max_daily_requests
    case level
    when 'registered'
      return 5000
    when 'gold'
      return 25000
    when 'platinum'
      return 99999999
    end
  end

end
