CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_REGION'] # Exemplo: 'us-east-1'
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME'] # Nome do bucket S3
  config.fog_public     = false
  config.storage        = :fog
end
