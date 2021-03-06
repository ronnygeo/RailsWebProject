class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable #,:confirmable

  has_one_time_password
  has_many :identities
  has_many :reviews

  mount_uploader :avatar, AvatarUploader
  process_in_background :avatar

  has_one :location, as: :geolocatable

  ROLES = %w[masteradmin manager moderator author banned]

  def is?(check_role)
    role.include?(check_role.to_s)
  end

  #Methods for 2FA

  def send_two_factor_authentication_code
    puts ">>>>>>>>>>>>>>> otp_code: #{otp_code}"
    # use Model#otp_code and send via SMS, etc.
    # put your own credentials here
    account_sid = 'ACf2afaa9cdc187bf7eef68ee0fa49d2b3' #figaro
    auth_token = 'f034694e4ad91d541ebb44900ea8d337' #figaro
=begin
# set up a client
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.sms.messages.create(
        :from => '+18142976181',
        :to => '+971529245741',
        :body => "Enter this code to login to awesomeness, otp_code: #{otp_code}, Enjoy.."
    )

=end
  end

   def need_two_factor_authentication?(request)
     request.ip != '0.0.0.0'
     request.ip != '127.0.0.1'
     request.ip != 'localhost'
     self.phone_verified = nil
   end



  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    puts auth.provider
    #puts auth.info.email
    #puts auth.info.email_verified

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = (auth.info.email) && (auth.info.verified || auth.info.verified_email || auth.extra.raw_info.email_verified || auth.provider == "foursquare")
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
            name: auth.extra.raw_info.name,
            #username: auth.info.nickname || auth.uid,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20],
            gender: auth.extra.raw_info.gender,
            phone: auth.info.phone,
            avatar:auth.info.image ? auth.info.image : auth.extra.raw_info.image
        )
        #user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

end
