class Book < ApplicationRecord
  belongs_to :user
  has_many :quotes, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :title, allow_nil: false, allow_blank: false
  validates :started, allow_nil: false
end