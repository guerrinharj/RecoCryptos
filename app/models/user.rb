class User < ApplicationRecord
  after_initialize :set_defaults
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :username, presence: true
  validates :photo, presence: true
  validate :non_zero


  def set_defaults
    self.portfolio ||= 0
    self.recos ||= 0
  end

  def non_zero
    self.recos = 0 if self.recos.negative?
  end
end
