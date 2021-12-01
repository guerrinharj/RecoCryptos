class Crypto < ApplicationRecord
  has_many :comments
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name, :symbol ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
