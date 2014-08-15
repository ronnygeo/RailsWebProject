require 'twilio-ruby'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_time_password
  has_many :identities

  def send_two_factor_authentication_code
    puts ">>>>>>>>>>>>>>> otp_code: #{otp_code}"
    # use Model#otp_code and send via SMS, etc.
    # put your own credentials here
    account_sid = 'ACf2afaa9cdc187bf7eef68ee0fa49d2b3'
    auth_token = 'f034694e4ad91d541ebb44900ea8d337'

# set up a client
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.sms.messages.create(
        :from => '+18142976181',
        :to => '+971529245741',
        :body => "Enter this code to login to awesomeness, otp_code: #{otp_code}, Enjoy.."
    )
  end

   def need_two_factor_authentication?(request)
     request.ip != '0.0.0.0'
   end

end
