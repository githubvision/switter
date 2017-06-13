class User < ApplicationRecord
	has_many :swits
	has_many :comments
	validates :password, presence:true,
		length: {
			minimum: 8
		}
	validates :first_name, presence:true
	validates :last_name, presence:true
	validates :username, presence:true
	validates :password, presence:true
	validates :email, presence:true
	validates :birthday, presence:true
	validates :bio, presence:true

end
