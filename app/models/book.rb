class Book < ApplicationRecord
  belongs_to :user
  has_many :quotes, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :title, presence: true
  validates :started, presence: true
end