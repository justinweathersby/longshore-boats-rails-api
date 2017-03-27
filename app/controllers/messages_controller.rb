class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @rep = User.find(params[:rep_id])
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
  end

  def show
  end

  private
   def conversation_params
    params.permit(:conversation_id, :rep_id)
   end
end
