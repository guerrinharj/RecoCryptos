class CryptosController < ApplicationController

  def api_get(cryptos)
    require 'json'
    require 'open-uri'

    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV['COINMARKETCAP_API_KEY']}"
    url_serialized = URI.open(url).read
    cryptos_obj = JSON.parse(url_serialized)
    cryptos_api = cryptos_obj['data']

    cryptos.each do |crypto|
      cryptos_api.each do |crypto_api|
        if crypto_api['name'] == crypto.name
          crypto.update!(
            max_supply: crypto_api['max_supply'],
            circulating_supply: crypto_api['circulating_supply'],
            total_supply: crypto_api['total_supply'],
            price: crypto_api['quote']['USD']['price'],
            volume_24h: crypto_api['quote']['USD']['volume_24h'],
            volume_change_24h: crypto_api['quote']['USD']['volume_change_24h'],
            percent_change_1h: crypto_api['quote']['USD']['percent_change_1h'],
            percent_change_24h: crypto_api['quote']['USD']['percent_change_24h'],
            percent_change_7d: crypto_api['quote']['USD']['percent_change_7d'],
            percent_change_30d: crypto_api['quote']['USD']['percent_change_30d'],
            market_cap: crypto_api['quote']['USD']['market_cap'],
            market_cap_dominance: crypto_api['quote']['USD']['market_cap_dominance']
          )
        end
      end
    end
  end

  def index
    skip_policy_scope

    if params[:query].present?
      @cryptos = Crypto.search_by_name(params[:query])
    elsif params[:sort].present?
      @cryptos = Crypto.all.order(params[:sort] + " " + params[:direction])
    else
      @cryptos = Crypto.all.order("price DESC")
    end

    api_get(@cryptos)
  end

  def show
    @crypto = Crypto.find(params[:id])
    authorize @crypto

    @found_like = Like.where(crypto_id: @crypto.id, user_id: current_user)
    @like = Like.new

    @comments = Comment.where(crypto_id: @crypto)
    @comment = Comment.new

    @reco = Reco.new
  end
end
