class User < ActiveRecord::Base
	after_create :send_notification

	def send_notification
		ContactMailer.new_message(self).deliver
	end

end
