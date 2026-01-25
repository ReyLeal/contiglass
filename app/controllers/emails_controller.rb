class EmailsController < ApplicationController
  def new
     @email = Email.new
   end

   def create
     @email = Email.new(email_params)

     if @email.valid?
       begin
         EmailMailer.new_email(@email).deliver_now
         flash[:notice] = "Your email has been sent!"
       rescue StandardError => e
         Rails.logger.error("Email delivery failed: #{e.class}: #{e.message}")
         flash[:alert] = "We couldn't send your message right now. Please try again later."
       end
       redirect_back(fallback_location: root_path)
     else
       flash[:alert] = "An error occurred while delivering this email."
       redirect_back(fallback_location: root_path)
     end
   end

 private

   def email_params
     params.require(:email).permit(:name, :email, :content)
   end
end
