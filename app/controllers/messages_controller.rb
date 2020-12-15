class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          content: @message.content,
          user: @message.user.name,
          user_id: @message.user.id,
          date: @message.created_at.strftime("%a %b %e at %l:%M%p"),
          message_id: @message.id
        }
      )
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
