class EmailMailer < ApplicationMailer
  default from: "contiglass.do.not.reply@gmail.com"
  default to: "horacio@contiglass.net"

  def new_email(email)
    @email = email
    mail subject: "Message from #{email.name}"
  end
end
