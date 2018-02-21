module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      # @cny_assets  = Currency.assets('cny')
#      @cny_assets  = Currency.assets('usd')
      @eur_assets  = Currency.assets('eur')
      @btc_proof   = Proof.current :btc
      @ltc_proof   = Proof.current :ltc
      @dsh_proof   = Proof.current :dsh
      @zec_proof   = Proof.current :zec
      @eth_proof   = Proof.current :eth
      @blk_proof   = Proof.current :blk
      @rpt_proof   = Proof.current :rpt
      @trt_proof   = Proof.current :trt
      # @cny_proof   = Proof.current :cny
      @usd_proof   = Proof.current :usd
      @cny_proof   = Proof.current :cny
      @eur_proof   = Proof.current :eur

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @ltc_account = current_user.accounts.with_currency(:ltc).first
        @dsh_account = current_user.accounts.with_currency(:dsh).first
        @zec_account = current_user.accounts.with_currency(:zec).first
        @eth_account = current_user.accounts.with_currency(:eth).first
        @blk_account = current_user.accounts.with_currency(:blk).first
        @rpt_account = current_user.accounts.with_currency(:rpt).first
        @trt_account = current_user.accounts.with_currency(:trt).first
        # @cny_account = current_user.accounts.with_currency(:cny).first
        @usd_account = current_user.accounts.with_currency(:usd).first
        @cny_account = current_user.accounts.with_currency(:cny).first
        @eur_account = current_user.accounts.with_currency(:eur).first
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end
