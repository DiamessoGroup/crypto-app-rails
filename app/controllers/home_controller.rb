class HomeController < ApplicationController
  def index
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=20&convert=USD&CMC_PRO_API_KEY=#{ENV['crypto_api']}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

  def about
  end

  def lookupindex
    render "lookup"
  end

  def lookup
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=20&convert=USD&CMC_PRO_API_KEY=#{ENV['crypto_api']}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)

    if params[:query]
      @symbol = params[:query].upcase
    end

    if params[:query].nil? || params[:query].empty?
      @symbol = "You forgot to enter a currency"
    end
  end
end
