class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username

  VALID_NAME_REGEX = /\A[\p{L} ,.'-]+$\z/i
  VALID_USER_REGEX = /\A[a-zA-Z0-9]+([_]?[a-zA-Z0-9]+)*\z/i
  validates :username, format: { with: VALID_USER_REGEX, message: "Uživatelské jméno obsahuje nepovolené znaky" }, uniqueness: true, presence: true
  validates :full_name, format: { with: VALID_NAME_REGEX, message: "Celé jméno obsahuje nepovolené znaky" }, presence: true, on: [:create, :update]
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Špatný formát emailové adresy" }
  validates :password_digest, presence: true, length: { minimum: 6 }
  # has_many :articles, dependent: :nullify_then_purge # miss hannigan gem, use in production, tests dont pass if enabled
  has_many :articles, dependent: :delete_all
  before_save { self.email = email.downcase }
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
