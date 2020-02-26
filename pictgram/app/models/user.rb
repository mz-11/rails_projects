class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  
  # 半角英字半角数字それぞれ1文字以上含む8文字以上32文字以下の文字列
  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
  
  # メールアドレスの正規表現を追加
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  
  has_secure_password
end
