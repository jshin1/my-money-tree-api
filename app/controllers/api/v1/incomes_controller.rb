class Api::V1::IncomesController < ApplicationController

  def index
    @incomes = Income.all
    render json: @incomes
  end

  def show
    @income = Income.find(params[:id])
    render json: @income
  end

  def create
    @income = Income.create(income_params)
    if @income.save
      render json: @income, status: :accepted
    else
      render json: { errors: @income.errors }, status: :unprocessible_entity
    end
  end

  def update
    @income = Income.find(params[:id])

    @income.update(income_params)
    if @income.save
      render json: @income, status: :accepted
    else
      render json: { errors: @income.errors }, status: :unprocessible_entity
    end
  end

  def destroy
    @income = Income.find(params[:id])

    @income.destroy
    render json: @income
  end

  private

  def income_params
    params.permit(:name, :amount, :user_id)
  end

  def find_income
    @income = Income.find(params[:id])
  end
end
