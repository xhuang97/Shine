class NewsletterController < ApplicationController

	def new
	end

	def create
			subject = params['email']['subject']
			filepath = ""
			filename = ""
			email_body = params['email']['body']
			
		if subject != "" && email_body != ""
			NewsletterMailer.send_newsletter(subject, email_body, filepath, filename)
			redirect_to newsletter_path, notice: "NewsLetter Sent!"
		
		else
	      flash[:error] = "Please enter a subject and email body"
	      render "new"
    	end
	end
end
