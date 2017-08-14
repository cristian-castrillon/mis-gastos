# Controller for expenses
class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @categories = Category.all
    if params[:category_id]
      @expenses = Expense.where(category_id: params[:category_id])
    elsif params[:expense_type]
      @expenses = Expense.where(expense_type: params[:expense_type])
    elsif params[:month]
      @expenses = Expense.where("extract(month from date) = ? AND extract(year from date) = ?", params[:month], params[:year])
    else
      @expenses = Expense.all
    end
    puts params
  end

  private

    def expense_params
      params.require(:expense).permit(:expense_type, :date, :concept, :category_id, :amount)
    end
end
