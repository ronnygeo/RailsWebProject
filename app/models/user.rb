require 'twilio-ruby'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_time_password

  #config.max_login_attempts = 3
  #config.allowed_otp_drift_seconds = 30

  def send_two_factor_authentication_code
    # use Model#otp_code and send via SMS, etc.
    @twilio_client.account.messages.create(
        :from => '+18142976181',
        :to => '+971529245741',
        :body => "Enter this code to login to awesomeness, secret key: #{otp_secret_key}, otp_code: #{otp_code}, Enjoy"
    )
  end

  def need_two_factor_authentication?(request)
    #request.ip != '0.0.0.0'
  end
end
