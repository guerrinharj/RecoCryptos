class Crypto < ApplicationRecord
  has_many :comments
  has_many :likes
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
