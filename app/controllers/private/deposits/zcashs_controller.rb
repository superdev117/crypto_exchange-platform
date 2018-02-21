module Private
  module Deposits
    class ZcashsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end