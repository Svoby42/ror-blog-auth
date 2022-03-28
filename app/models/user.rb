class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username

  VALID_USER_REGEX = /\A[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*\z/i
  validates :username, format: { with: VALID_USER_REGEX, message: "Uživatelské jméno obsahuje nepovolené znaky" }, uniqueness: true, presence: true
  validates :full_name, presence: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Špatný formát emailové adresy" }
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
