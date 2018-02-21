module Admin
  module Withdraws
    class MonerosController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Monero'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_moneros = @moneros.with_aasm_state(:accepted).order("id DESC")
        @all_moneros = @moneros.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @monero.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @monero.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end