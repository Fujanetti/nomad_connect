class MessagesController < ApplicationController
    def create 
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = Message.new(message_params)
        @message.chatroom = @chatroom
        @message.user = current_user
        if @message.save
            ChatroomChannel.broadcast_to(
                @chatroom,
                render_to_string(partial: "message", locals: { message: @message })
              )

            # redirect_to city_forum_posts_path(@chatroom.forum.city, @chatroom.forum, anchor: "message-#{@message.id}")
        else
            render 'chatrooms/show'
        end 

    end 

    def message_params
        params.require(:message).permit(:content)
    end 
end