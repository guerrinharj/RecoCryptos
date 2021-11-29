class Comment < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :user
  belongs_to :crypto

  validates :content, presence: true

  def set_defaults
    self.is_edited ||= false
  end
end
