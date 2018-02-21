module Private::Withdraws
  class ZcashsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end