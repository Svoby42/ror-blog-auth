class Article < ApplicationRecord
  VALID_SLUG_REGEX = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/i
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 50 }
  validates :slug, presence: true, length: { maximum: 35 }, format: { with: VALID_SLUG_REGEX }
end
