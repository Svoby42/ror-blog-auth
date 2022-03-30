class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  VALID_SLUG_REGEX = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/i
  has_many :articles
  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :slug, presence: true, length: { maximum: 50 }, format: { with: VALID_SLUG_REGEX }, uniqueness: true
  validates :description, presence: true, length: { maximum: 100 }

end
