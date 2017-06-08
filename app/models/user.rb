class User < ApplicationRecord
	has_many :swits
	validates :password, presence:true,
		length: {
			minimum: 8
		}
	validates :email, presence:true
	validates :username, presence:true
	validates :birthday, presence:true
end
