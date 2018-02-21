module Private::Withdraws
  class DashcoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end