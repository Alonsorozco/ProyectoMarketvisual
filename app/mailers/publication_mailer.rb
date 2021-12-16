class PublicationMailer < ApplicationMailer

    def new_publication_email
        @publication = params[:publication]
        mail(to: "sfabian.orozco@gmail.com", subject: "You got a new order!")
    end


end
