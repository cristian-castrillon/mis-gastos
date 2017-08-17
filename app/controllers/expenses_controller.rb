# Controller for expenses
class ExpensesController < ApplicationController
  before_action :find_expense, only: [:edit, :update, :destroy]
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
    # @expense = Expense.new
    # puts params
  end

  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def create
    expense = Expense.new(expense_params)
    if expense.save
      redirect_to(expenses_path, notice: 'Expense has been created successfully')
    else
      # @errors = expense.errors.full_messages
      @categories = Category.all
      @expenses = Expense.all
      @expense = Expense.new
      render :index
    end
  end

  def edit
    @categories = Category.all
    @expenses = Expense.all
  end

  def update
    @expense.update(expense_params)
    redirect_to(expenses_path, notice: 'Expense has been updated successfully')
  end

  def destroy
    @expense.destroy
    redirect_to(expenses_path, notice: 'Expense has been deleted successfully')
  end

  private

    def expense_params
      params.require(:expense).permit(:expense_type, :date, :concept, :category_id, :amount)
    end

    def find_expense
      @expense = Expense.find(params[:id])
    end
end
