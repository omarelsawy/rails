class Post < ApplicationRecord
	has_many :comments
	belongs_to :user , optional: true
	validates :title, presence:true,length: {minimum: 5}
end
