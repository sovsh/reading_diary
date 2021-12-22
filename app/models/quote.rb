class Quote < ApplicationRecord
  belongs_to :book
  validates :text, presence: true
end