class Api::V1::EquitiesController < ApplicationController

  def index
    @equities = Equity.all
    render json: @equities
  end

  def show
    @equity = Equity.find(params[:id])
    render json: @equity
  end

  def create
    @equity = Equity.create(equity_params)
    if @equity.save
      render json: @equity, status: :accepted
    else
      render json: { errors: @equity.errors }, status: :unprocessible_entity
    end
  end

  def update
    @equity = Equity.find(params[:id])

    @equity.update(equity_params)
    if @equity.save
      render json: @equity, status: :accepted
    else
      render json: { errors: @equity.errors }, status: :unprocessible_entity
    end
  end

  def destroy
    @equity = Equity.find(params[:id])

    @equity.destroy
    render json: @equity
  end

  private

  def equity_params
    params.permit(:name, :amount, :user_id)
  end

  def find_equity
    @equity = Equity.find(params[:id])
  end
end
