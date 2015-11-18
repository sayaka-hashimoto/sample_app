class User < ActiveRecord::Base

  # DBに保存前のemailが全て小文字になる
  before_save { self.email = email.downcase }

 # name
  validates :name, presence: true, length: { maximum: 50 }
  
 # email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:  { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }
  
end