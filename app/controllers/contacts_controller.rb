class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|

      if @contact.valid?
        puts @contact.valid?
        send_notifications(@contact)
        format.html { redirect_to root_path, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created}
      else
        puts @contact.valid?
        format.html { render :index, :flash=>{:error =>"Contact was invalid"}}
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def send_notifications(contact)
      ContactMailer.new_user_message(contact).deliver
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message)
    end
   
end
