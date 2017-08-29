# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  expense_type :string
#  date         :date
#  concept      :string
#  category_id  :integer
#  amount       :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  def setup
    @expense = expenses(:one)
  end
  test "it should create a new expense" do
    category = categories(:one)
    expense = Expense.new(expense_type: 'compra', date: Date.today, concept: 'Pastas con albondigas', category: category, amount: 17000.00)
    assert expense.save
  end

  test "it should validate concept must exist" do
    @expense.concept = nil
    @expense.validate
    assert_includes(@expense.errors[:concept], "can't be blank")
  end

  test "it should validate date must exist" do
    @expense.date = nil
    @expense.validate
    assert_includes(@expense.errors[:date], "can't be blank")
  end

  test "it should validate amount must exist" do
    @expense.amount = nil
    @expense.validate
    assert_includes(@expense.errors[:amount], "can't be blank")
  end
end
