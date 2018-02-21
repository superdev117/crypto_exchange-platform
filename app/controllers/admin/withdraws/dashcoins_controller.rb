module Admin
  module Withdraws
    class DashcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Dashcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_dashcoins = @dashcoins.with_aasm_state(:accepted).order("id DESC")
        @all_dashcoins = @dashcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @dashcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @dashcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end