require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @expense = expenses(:one)
  end

  test "a user can update an existing expense" do
    category = categories(:one)
    patch expense_path(@expense), params: { expense: { expense_type: 'compra', date: Date.today, concept: 'Pastas con albondigas', category: category, amount: 17000.00 } }
    assert_redirected_to expenses_path
    assert_equal 'Expense has been updated successfully', flash[:notice]
  end

  test "a user can delete an existing expense" do
    delete expense_path(@expense)
    assert_redirected_to expenses_path
    assert_equal 'Expense has been deleted successfully', flash[:notice]
  end
end
