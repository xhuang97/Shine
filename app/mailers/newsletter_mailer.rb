class NewsletterMailer < ApplicationMailer
	default to: 
	#http://guides.rubyonrails.org/action_mailer_basics.html
	def send_newsletter(subject, email_body, filepath, filename)
		
		
		attachments[filename] = File.read(filepath)
		mail(subject: subject, body: email_body, content_type: "text/html")
	end

end
