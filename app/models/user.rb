class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
