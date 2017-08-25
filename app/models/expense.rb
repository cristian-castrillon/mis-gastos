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
  after_initialize :set_default

  validates :date, :concept, :amount, presence: true

  def set_default
    self.date ||= Date.today
    self.amount ||= 0.0
  end
end
