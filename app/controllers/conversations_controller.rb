class ConversationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@users =  User.all
		@conversations = Conversation.all
	end

	def create
		if conversaton.between(params[:sender_id], params[:recpient_id]).present?
			@conversations = Conversation.between(params[:sender_id], params[:recpient_id]).first
		else
			@conversation = Conversation.create!(conversation_params)
		end
		redirect_to conversation_messages_path(@conversation)
	end
		
	private

	def conversation_params
		params.permit(:sender_id, :recpient_id)
	end	
	
	
end