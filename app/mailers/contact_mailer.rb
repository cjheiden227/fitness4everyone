class ContactMailer < ApplicationMailer
	def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	end
	def new_message(user)
		@user = user
		mail(to: "#{user.email}", subject: "Message from #{user.email}")
	end

	def new_user(user)
		template_name = "new-user"
		template_content = []
		message = {
			to: [{email: user.email, name: user.name}],
			subject: "New User: #{user.name}",
			merge_vars: [
				{
					rcpt: user.email, 
					vars:[
						{name: "USER_NAME", content: user.name}
					]
				}
			]
		}

		mandrill_client.messages.send_template(template_name, template_content, message)
	end
end
