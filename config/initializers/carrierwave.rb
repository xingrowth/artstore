CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials ={
      provider:               'AWS',
      aws_access_key_id:      ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key:  ENV["AWS_SECRET_ACCESS_KEY"],
      region:                 'ap-southeast-1' #S3 bucket 的Region 位置
    }
    config.fog_directory  = ENV["AWS_BUCKET_NAME"]
  elsel
    config.storage :file

  end
end
