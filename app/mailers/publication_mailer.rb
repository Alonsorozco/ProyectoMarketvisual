class PublicationMailer < ApplicationMailer

    def new_publication_email
        @publication = params[:publication]
        mail(to: "#{@publication.user.email}" , subject: "You got a new order!")
    end


end
