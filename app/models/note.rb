class Note <  ApplicationRecord
  belongs_to :book
  validates :text, allow_nil: false, allow_blank: false
  validates :date, allow_nil: false
end