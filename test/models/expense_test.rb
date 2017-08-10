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
  # test "the truth" do
  #   assert true
  # end
end
