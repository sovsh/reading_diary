class Note <  ApplicationRecord
  belongs_to :book
  validates :text, presence: true
  validates :date, presence: true
end