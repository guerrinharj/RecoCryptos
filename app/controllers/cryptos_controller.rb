class CryptosController < ApplicationController

  def index
    @cryptos = policy_scope(Crypto)
  end

end
