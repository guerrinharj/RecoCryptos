class WalletInclusion < ApplicationRecord
  belongs_to :user
  belongs_to :crypto

  validates :buying_price, presence: true
  validates :amount, presence: true
end
