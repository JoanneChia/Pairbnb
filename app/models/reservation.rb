class Reservation < ActiveRecord::Base
	belongs_to :user 
	belongs_to :listing 
	
	validates :checkin_date, :checkout_date, :overlap => {:scope => "listing_id"}
end


