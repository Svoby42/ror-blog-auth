class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_rich_text :article_content
  has_many_attached :images, dependent: :destroy

  VALID_SLUG_REGEX = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/i
  belongs_to :user
  belongs_to :topic
  validates :title,   presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :article_content, presence: true, length: { minimum: 10, message: "Článek je příliš krátký" }
  validates :slug,    presence: true, length: { maximum: 50 }, format: { with: VALID_SLUG_REGEX }
end
