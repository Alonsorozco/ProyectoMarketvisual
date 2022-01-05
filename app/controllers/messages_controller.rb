class MessagesController < ApplicationController
    def create
        @message = Message.new
        @message.content = params[:message][:content]
        @message.user = current_user
        @message.quote = Quote.find(params[:message][:quote_id])
        @message.publication = Publication.find(@message.quote.publication.id)
        if @message.save!
            respond_to do |f|
                f.html {redirect_to @message.quote}
            end
        end
    end
end
