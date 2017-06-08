class Swit < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :post, presence: true,
  	length: {
  		maximum: 140
  	}
end
