require 'digest'
class User < ApplicationRecord

  attr_accessor :remember_token

  before_save {email.downcase!}


  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :posts

#====================================================================================


def self.digest(token_string)
	Digest::SHA1.hexdigest(token_string)
end


def self.new_token
	SecureRandom.urlsafe_base64
end

def remember
	self.remember_token = User.new_token
	update_attribute(:remember_digest, User.digest(remember_token))
end

def authenticated?(remember_token)
	Digest::SHA1.hexdigest(remember_token) == remember_digest
end



end
