class SupportticketsController < ApplicationController
  before_action :set_supportticket, only: [:show, :edit, :update, :destroy, :create_response]
  before_action :authenticate_user!

  # GET /supporttickets
  def index
    @supporttickets = current_user.supporttickets
  end

  # GET /supporttickets/1
  def show
    @response = @supportticket.responses.build
  end

  # GET /supporttickets/new
  def new
    @supportticket = Supportticket.new
  end

  # GET /supporttickets/1/edit
  def edit
  end

  # POST /supporttickets
  def create
    @supportticket = current_user.supporttickets.new(supportticket_params)

    if @supportticket.save
      redirect_to @supportticket, notice: 'Supportticket was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /supporttickets/1
  def update
    if @supportticket.update(supportticket_params)
      if @supportticket.status == 'closed' && @supportticket.closed_date.nil?
        @supportticket.update(closed_date: Time.current)
      end
      redirect_to @supportticket, notice: 'Supportticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /supporttickets/1
  def destroy
    @supportticket.destroy
    redirect_to supporttickets_url, notice: 'Supportticket was successfully destroyed.'
  end

  # POST /supporttickets/:id/create_response
  def create_response
    @response = @supportticket.responses.build(response_params)
    @response.user = current_user

    if @response.save
      redirect_to @supportticket, notice: 'Response was successfully created.'
    else
      render :show
    end
  end

  private

  def response_params
    params.require(:response).permit(:body)
  end

  def set_supportticket
    @supportticket = Supportticket.find(params[:id])
  end

  def supportticket_params
    params.require(:supportticket).permit(:title, :description, :status)
  end
end
