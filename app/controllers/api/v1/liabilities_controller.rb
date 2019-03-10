class Api::V1::LiabilitiesController < ApplicationController

  def index
    @liabilities = Liability.all
    render json: @liabilities
  end

  def show
    @liability = Liability.find(params[:id])
    render json: @liability
  end

  def create
    @liability = Liability.create(liability_params)
    if @liability.save
      render json: @liability, status: :accepted
    else
      render json: { errors: @liability.errors }, status: :unprocessible_entity
    end
  end

  def update
    @liability = Liability.find(params[:id])

    @liability.update(liability_params)
    if @liability.save
      render json: @liability, status: :accepted
    else
      render json: { errors: @liability.errors }, status: :unprocessible_entity
    end
  end

  def destroy
    @liability = Liability.find(params[:id])

    @liability.destroy
    render json: @liability
  end

  private

  def liability_params
    params.permit(:name, :amount, :user_id)
  end

  def find_liability
    @liability = Liability.find(params[:id])
  end
end
