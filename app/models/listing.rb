class Listing < ActiveRecord::Base
	
	belongs_to :user 
	has_many :reservations

	mount_uploader :image, ImageUploader


	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true, numericality: true

end



