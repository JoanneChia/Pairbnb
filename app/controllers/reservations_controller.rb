class ReservationsController < ApplicationController

	def new
		@listing = current_listing
		@reservation = @listing.reservations.new
	end

	def create	
		@reservation = current_listing.reservations.new(reservations_params)
		if @reservation.save	
			a = @reservation.checkout_date - @reservation.checkin_date
			@reservation[:day_count] = a.to_i
			@reservation[:total_price] = (a.to_i)*(current_listing.price)
			@reservation.save
			flash[:success] = "Successful reservation"
			redirect_to listings_path 
		else
			flash[:warning] = "Reservation was unsuccessful"
			@listing = @reservation.listing
			redirect_to new_listing_reservation_path
		end
	end

	private 

	def reservations_params 
		params.require(:reservation).permit(:checkin_date, :checkout_date, :people_count)
	end

  def overlap
  end
end
