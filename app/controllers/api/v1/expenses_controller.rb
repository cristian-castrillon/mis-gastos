class Api::V1::ExpensesController < ApplicationController
  def index
    expenses = Expense.all
    render json: expenses
  end

  def create
    expense = Expense.new(expense_params)
    if expense.save
      render json: expense, status: :created, location: expense
    else
      render json: expense.errors, status: :unprocessable_entity
    end
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update(expense_params)
      render json: expense, status: :ok, location: expense
    else
      render json: expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    head :no_content
  end

  private

      def expense_params
        params.require(:expense).permit(:expense_type, :date, :concept, :category_id, :amount)
      end
end