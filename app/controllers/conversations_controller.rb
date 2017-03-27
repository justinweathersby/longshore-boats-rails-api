class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rep = User.find(params[:rep_id])
    @conversations = Conversation.where("sender_id = ? OR recipient_id = ?", @rep.id, @rep.id).order(updated_at: :desc)
  end

  def show
  end

  private
   def conversation_params
    params.permit(:rep_id)
   end
end
