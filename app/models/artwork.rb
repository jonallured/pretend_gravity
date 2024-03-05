class Artwork < ApplicationRecord
  validates :amount_cents, presence: true
  validates :artist_name, presence: true
  validates :medium, presence: true
  validates :title, presence: true
end
