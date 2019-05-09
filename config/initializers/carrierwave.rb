require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #本番環境とテスト、ローカルの保存先を分ける
    config.strage = :file
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: 'ap-northeast-1' #例 'ap-northeast-1'
    }

  config.fog_directory  = 'freemarket50b'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket50b'
  end
end
