class Listing < ActiveRecord::Base
	
	belongs_to :user 
	has_many :reservations

	mount_uploader :image, ImageUploader


	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true, numericality: true
	validate :image_size

	private

    # Validates the size of an uploaded picture.
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end

end



