class Contact 
	include ActiveAttr::Model
	include ActiveModel::Validations


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

end
