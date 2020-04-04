# S3のための設定
unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      # 機密情報漏えいを防ぐために.bash_profileにid等の情報について環境変数設定を行った
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFUALT_REAGION']
    }

    config.fog_directory  = 'rails-projects-photo'
    config.cache_storage = :fog
  end
end