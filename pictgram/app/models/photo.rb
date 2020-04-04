# S3への保存設定　画像用モデルをcarrierwave用に変更
# topic.rbでimageカラムを設定しているのでphoto.rbは不要だった。
class Photo < ApplicationRecord
  # mount_uploader :image, ImageUploader
end
