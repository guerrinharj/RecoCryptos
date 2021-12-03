class Comment < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :user
  belongs_to :crypto

  has_many :recos, dependent: :destroy

  validates :content, length: { minimum: 3 }, presence: true

  def set_defaults
    self.is_edited ||= false
  end
end
