class ExampleMailer < ApplicationMailer
	default from: "joannejchia@gmail.com"

	def listing_confirmation(listing)
		@listing = listing
    mail(to: @listing.user.email, subject: 'You have successfully listed your castle')
  end


	# def reservation_confirmation(user)
 #    @user = user
 #    mail(to: @user.email, subject: 'Welcome to PairBnB')
 #  end
end
