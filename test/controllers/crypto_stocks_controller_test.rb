require "test_helper"

class CryptoStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypto_stock = crypto_stocks(:one)
  end

  test "should get index" do
    get crypto_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_crypto_stock_url
    assert_response :success
  end

  test "should create crypto_stock" do
    assert_difference('CryptoStock.count') do
      post crypto_stocks_url, params: { crypto_stock: { amount_owned: @crypto_stock.amount_owned, cost_per: @crypto_stock.cost_per, symbol: @crypto_stock.symbol, user_id: @crypto_stock.user_id } }
    end

    assert_redirected_to crypto_stock_url(CryptoStock.last)
  end

  test "should show crypto_stock" do
    get crypto_stock_url(@crypto_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypto_stock_url(@crypto_stock)
    assert_response :success
  end

  test "should update crypto_stock" do
    patch crypto_stock_url(@crypto_stock), params: { crypto_stock: { amount_owned: @crypto_stock.amount_owned, cost_per: @crypto_stock.cost_per, symbol: @crypto_stock.symbol, user_id: @crypto_stock.user_id } }
    assert_redirected_to crypto_stock_url(@crypto_stock)
  end

  test "should destroy crypto_stock" do
    assert_difference('CryptoStock.count', -1) do
      delete crypto_stock_url(@crypto_stock)
    end

    assert_redirected_to crypto_stocks_url
  end
end
