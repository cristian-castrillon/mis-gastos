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

class Expense < ApplicationRecord
  belongs_to :category
end
