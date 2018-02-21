module Private
  module Deposits
    class MonerosController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end