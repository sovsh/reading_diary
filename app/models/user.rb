class User < ApplicationRecord
  has_many :books, dependent:  :destroy
  validates :name, allow_nil: false, allow_blank: false
  validates :email, allow_nil: false, allow_blank: false
  validates :password, allow_nil: false
end