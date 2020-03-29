# S3への保存設定　画像用モデルをcarrierwave用に変更
class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
end
