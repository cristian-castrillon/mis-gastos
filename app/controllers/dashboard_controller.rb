class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @categories = Category.all
    @today = Expense.where(date: Date.today).sum(:amount)
    @yesterday = Expense.where(date: 1.days.ago).sum(:amount)
    @this_month = Expense.where('extract(month from date) = ?', Date.today.month).sum(:amount)
    @last_month = Expense.where('extract(month from date) = ?', 1.month.ago.month).sum(:amount)
    @last_6_months = Expense.where('extract(month from date) BETWEEN ? AND ?', 5.months.ago.month, Date.today.month).group(:expense_type).group('extract(month from date)').order('extract(month from date)').count
    @per_day = Expense.where('extract(month from date) = ?', Date.today.month).order('extract(day from date)').group(:expense_type).group('extract(day from date)').count
    @per_category = Expense.includes(:category).where('extract(month from date) = ?', Date.today.month).group(:category_id).count
    @name_this_month = Date::MONTHNAMES[Date.today.month]
    @name_last_month = Date::MONTHNAMES[1.month.ago.month]
    sum = 0
    sum2 = 0
    @acum_this_month = Expense.where('extract(month from date) = ?', Date.today.month).order('extract(day from date)').group('extract(day from date)').sum(:amount).map { |x,y| { x => (sum += y)} }.reduce({}, :merge)
    @acum_last_month = Expense.where('extract(month from date) = ?', 1.month.ago.month).order('extract(day from date)').group('extract(day from date)').sum(:amount).map { |x,y| { x => (sum2 += y)} }.reduce({}, :merge)
  end
end
