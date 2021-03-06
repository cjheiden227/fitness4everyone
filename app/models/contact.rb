class Contact 
	# include ActiveAttr::Model
	# include ActiveModel::Validations
    include ActiveModel::Model

    attr_accessor :name, :email, :phone, :message

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    #Validations
    validates :name, presence: true 
    validates :email, presence: true 
    validates :email, email_format: true
    validates :phone, presence: true
    validates :message, presence: true

    validates_length_of :message, maximum: 500

end
