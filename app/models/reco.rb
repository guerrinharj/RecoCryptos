class Reco < ApplicationRecord
  belongs_to :user
  belongs_to :crypto
  belongs_to :comment
end
