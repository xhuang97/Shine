class NewsletterMailer < ApplicationMailer
	default to: Proc.new {NewsLetter.pluck(:email)}

	def send_newsletter(subject, email_body, filepath, filename)
		if filename != "" && filepath != "" && File.exist?(filepath)
			attachments[filename] = File.read(filepath)
		end
		mail(subject: subject, body: email_body, content_type: "text/html")
	end

end
