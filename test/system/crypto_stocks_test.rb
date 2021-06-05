require "application_system_test_case"

class CryptoStocksTest < ApplicationSystemTestCase
  setup do
    @crypto_stock = crypto_stocks(:one)
  end

  test "visiting the index" do
    visit crypto_stocks_url
    assert_selector "h1", text: "Crypto Stocks"
  end

  test "creating a Crypto stock" do
    visit crypto_stocks_url
    click_on "New Crypto Stock"

    fill_in "Amount owned", with: @crypto_stock.amount_owned
    fill_in "Cost per", with: @crypto_stock.cost_per
    fill_in "Symbol", with: @crypto_stock.symbol
    fill_in "User", with: @crypto_stock.user_id
    click_on "Create Crypto stock"

    assert_text "Crypto stock was successfully created"
    click_on "Back"
  end

  test "updating a Crypto stock" do
    visit crypto_stocks_url
    click_on "Edit", match: :first

    fill_in "Amount owned", with: @crypto_stock.amount_owned
    fill_in "Cost per", with: @crypto_stock.cost_per
    fill_in "Symbol", with: @crypto_stock.symbol
    fill_in "User", with: @crypto_stock.user_id
    click_on "Update Crypto stock"

    assert_text "Crypto stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Crypto stock" do
    visit crypto_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crypto stock was successfully destroyed"
  end
end
