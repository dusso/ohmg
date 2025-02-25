class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :destroy]

  def index
    @messages = Message.all  # Certifique-se de que você tem o modelo Message e ele está carregando as mensagens
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)  # Supondo que um usuário possa enviar mensagens
    if @message.save
      redirect_to @message, notice: 'Mensagem enviada com sucesso.'
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: 'Mensagem excluída com sucesso.'
  end

  private

  def message_params
    params.require(:message).permit(:subject, :body)
  end
end
