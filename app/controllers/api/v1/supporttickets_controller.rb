class Api::V1::SupportticketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @supporttickets = Supportticket.includes(:responses).all
    render json: @supporttickets.as_json(include: :responses)
  end

  def show
    @supportticket = Supportticket.includes(:responses).find(params[:id])
    if @supportticket
      render json: @supportticket.as_json(include: :responses)
    else
      render json: { error: 'Support ticket not found' }, status: :not_found
    end
  end

  def create
    @supportticket = Supportticket.new(supportticket_params)
    
    if @supportticket.save
      render json: @supportticket, status: :created
    else
      render json: @supportticket.errors, status: :unprocessable_entity
    end
  end

  def update
    @supportticket = Supportticket.find(params[:id])

    if @supportticket.update(supportticket_params)
      render json: @supportticket, status: :ok
    else
      render json: { errors: @supportticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @supportticket = Supportticket.find(params[:id])
    if @supportticket
      @supportticket.destroy
      head :no_content
    else
      render json: { error: 'Support ticket not found' }, status: :not_found
    end
  end

  def create_response
    @supportticket = Supportticket.find(params[:id])
    @response = @supportticket.responses.build(response_params)

    if @response.save
      render json: @response, status: :created
    else
      render json: { errors: @response.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def supportticket_params
    params.require(:supportticket).permit(:title, :description, :status, :user_id,:closed_date)
  end

  def response_params
    params.require(:response).permit(:body, :user_id)
  end
end
