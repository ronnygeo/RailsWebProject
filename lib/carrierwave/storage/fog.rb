require 'carrierwave'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAJXMLJWXUJJGSXRYQ',                        # required
      :aws_secret_access_key  => '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',                        # required
      #:region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
      #:host                   => 's3.example.com',             # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'mycityamigo'                     # required
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end