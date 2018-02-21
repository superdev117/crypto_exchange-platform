module Admin
  module Withdraws
    class ZcashsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Zcash'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_zcashs = @zcashs.with_aasm_state(:accepted).order("id DESC")
        @all_zcashs = @zcashs.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @zcash.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @zcash.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end