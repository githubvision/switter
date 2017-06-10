class Swit < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :sweets
  has_many :sours
  validates :post, presence: true,
  	length: {
  		maximum: 140
  	}
end
