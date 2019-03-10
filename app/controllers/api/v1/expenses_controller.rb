class Api::V1::ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def show
    @expense = Expense.find(params[:id])
    render json: @expense
  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      render json: @expense, status: :accepted
    else
      render json: { errors: @expense.errors }, status: :unprocessible_entity
    end
  end

  def update
    @expense = Expense.find(params[:id])

    @expense.update(expense_params)
    if @expense.save
      render json: @expense, status: :accepted
    else
      render json: { errors: @expense.errors }, status: :unprocessible_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

    @expense.destroy
    render json: @expense
  end

  private

  def expense_params
    params.permit(:name, :amount, :user_id)
  end

  def find_expense
    @expense = Expense.find(params[:id])
  end
end
