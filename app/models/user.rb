class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
