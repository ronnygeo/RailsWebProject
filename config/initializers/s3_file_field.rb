=begin
S3FileField.config do |c|
=begin

  c.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  c.bucket = ENV['AWS_BUCKET']

  c.access_key_id = 'AKIAJXMLJWXUJJGSXRYQ'
  c.secret_access_key = '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'
  c.bucket = 'mycityamigo'
  c.acl = "public-read"
  # c.expiration = 10.hours.from_now.utc.iso8601
  c.max_file_size = 10.megabytes
  # c.conditions = []
  # c.key_starts_with = 'uploads/
  # c.ssl = true # if true, force SSL connection


=end
