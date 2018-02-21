module Private::Withdraws
  class NamecoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end