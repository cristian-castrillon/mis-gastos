# Controller for expenses
class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @expenses = Expense.all
  end
end
