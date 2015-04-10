class Message < ActiveRecord::Base
	belongs_to :users
	validates :message, presence: true
end