class CryptoStocksController < ApplicationController
  before_action :set_crypto_stock, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new]
  before_action :right_user, only: [:show, :edit, :update, :destroy]


  # GET /crypto_stocks or /crypto_stocks.json
  def index
    console
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=200&convert=USD&CMC_PRO_API_KEY=#{ENV['crypto_api']}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_crypto = JSON.parse(@response)

    @crypto_stocks = CryptoStock.all
  end

  # GET /crypto_stocks/1 or /crypto_stocks/1.json
  def show
  end

  # GET /crypto_stocks/new
  def new
    @crypto_stock = CryptoStock.new
  end

  # GET /crypto_stocks/1/edit
  def edit
  end

  # POST /crypto_stocks or /crypto_stocks.json
  def create
    @crypto_stock = CryptoStock.new(crypto_stock_params)

    respond_to do |format|
      if @crypto_stock.save
        format.html { redirect_to @crypto_stock, notice: "Crypto stock was successfully created." }
        format.json { render :show, status: :created, location: @crypto_stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crypto_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypto_stocks/1 or /crypto_stocks/1.json
  def update
    respond_to do |format|
      if @crypto_stock.update(crypto_stock_params)
        format.html { redirect_to @crypto_stock, notice: "Crypto stock was successfully updated." }
        format.json { render :show, status: :ok, location: @crypto_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crypto_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypto_stocks/1 or /crypto_stocks/1.json
  def destroy
    @crypto_stock.destroy
    respond_to do |format|
      format.html { redirect_to crypto_stocks_url, notice: "Crypto stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto_stock
      @crypto_stock = CryptoStock.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to crypto_stocks_path, notice: "#{e}"
    end


    # Only allow a list of trusted parameters through.
    def crypto_stock_params
      params.require(:crypto_stock).permit(:symbol, :cost_per, :amount_owned, :user_id)
    end

    def right_user
      if current_user != @crypto_stock.user
        redirect_to crypto_stocks_path, notice: "You are not the right user"
      end
    end
end
