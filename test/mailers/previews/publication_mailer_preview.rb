# Preview all emails at http://localhost:3000/rails/mailers/publication_mailer
class PublicationMailerPreview < ActionMailer::Preview
    def new_order_email
        # Set up a temporary order for the preview
        publication= Publication.new(title: "Joe Smith", description: "joe@gmail.com")
    
        PublicationMailer.with(publication: publication).new_publication_email
    end
end
