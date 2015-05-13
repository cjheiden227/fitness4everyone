MANDRILL_API_KEY = 'ZqYsCsBWlHJJ6SXM2p8THA'

ActionMailer::Base.smtp_settings = {
	address: 'smtp.mandrillapp.com',
	port: 587,
	enable_startttls_auto: true,
	user_name: 'cjheiden227@gmail.com',
	password: MANDRILL_API_KEY,
	authentication: 'login'
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'