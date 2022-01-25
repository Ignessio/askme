class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  EMAIL_FORMAT = /\A\w+@\w+\.\w+\z/
  USERNAME_FORMAT = /\A\w+\z/
  COLOR_FORMAT = /\A(#[\d\w]+|\w+\((?:\d+%?(?:,\s)*){3}(?:\d*\.?\d+)?\))\z/

  has_many :questions, dependent: :destroy

  attr_accessor :password

  before_validation :convert_to_downcase
  before_save :encrypt_password
  before_update :check_color

  validates :username,
           presence: true,
           uniqueness: true,
           length: { maximum: 40 },
           format: { with: USERNAME_FORMAT }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: EMAIL_FORMAT }

  validates :password,
            confirmation: true,
            presence: true,
            on: :create

  private

  def check_color
    color if color =~ COLOR_FORMAT
  end

  def convert_to_downcase
    username&.downcase!
    email&.downcase!
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email.downcase)
    user if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
  end
end
