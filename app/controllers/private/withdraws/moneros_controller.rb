module Private::Withdraws
  class MonerosController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end