class User
	include ActiveAttr::Model
	include ActiveModel::Validations
	extend ActiveModel::Callbacks

    define_model_callbacks :create

    attribute :name
    attribute :email
    attribute :phone
    attribute :message

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    #Validations
    validates_presence_of :name
    validates_presence_of :email 
    validates :email, format: { with: VALID_EMAIL_REGEX}
    validates_presence_of :phone

    validates_length_of :message, maximum: 500

    def create
    	 _run_create_callbacks do
        ##CODE TO EXECUTE HERE
    	end
    end
    
    after_create :send_notification

	def send_notification
		ContactMailer.new_message(self).deliver_now
	end

end
