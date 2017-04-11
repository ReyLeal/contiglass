class EmailsController < ApplicationController
  def new
     @email = Email.new
   end

   def create
     @email = Email.new(email_params)

     if @email.valid?
       EmailMailer.new_email(@email).deliver
       redirect_to :back
       flash[:alert] = "Your email has been sent!"
     else
       flash[:alert] = "An error occurred while delivering this email."
       redirect_to :back
     end
   end

 private

   def email_params
     params.require(:email).permit(:name, :email, :content)
   end
end
