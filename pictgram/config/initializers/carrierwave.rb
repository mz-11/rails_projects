# S3のための設定
unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAY5H5M6W7EW5EY2H4',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-projects-photo'
    config.cache_storage = :fog
  end
end