require "application_system_test_case"

class CreateExpensesTest < ApplicationSystemTestCase
  test "a user can create an expense" do
    visit expenses_path
    click_link "New Expense"

    fill_in "Fecha", with: Date.today
    fill_in "Concepto", with: "Bandeja Paisa"
    fill_in "Valor", with: 17000.00
    click_button "Guardar"

    assert_text "Bandeja Paisa"
  end
end