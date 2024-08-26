class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_supportticket

  def create
    @response = @supportticket.responses.build(response_params)
    @response.user = current_user

    if @response.save
      redirect_to @supportticket, notice: 'Response was successfully created.'
    else
      redirect_to @supportticket, alert: 'Error creating response.'
    end
  end

  def destroy
    @response = @supportticket.responses.find(params[:id])
    @response.destroy
    redirect_to @supportticket, notice: 'Response was successfully deleted.'
  end

  private

  def set_supportticket
    @supportticket = Supportticket.find(params[:supportticket_id])
  end

  def response_params
    params.require(:response).permit(:body)
  end
end
