class Quote < ApplicationRecord
  belongs_to :book
  validates :text, allow_nil: false, allow_blank: false
end