module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      return unless user.admin?

      can :read, Order
      can :read, Trade
      can :read, Proof
      can :update, Proof
      can :manage, Document
      can :manage, Member
      can :manage, Ticket
      can :manage, IdDocument
      can :manage, TwoFactor

      can :menu, Deposit
      can :manage, ::Deposits::Bank
      can :manage, ::Deposits::Satoshi
      can :manage, ::Deposits::Blackcoin
      can :manage, ::Deposits::Litecoin
      can :manage, ::Deposits::Dashcoin
      can :manage, ::Deposits::Zcash
      can :manage, ::Deposits::Ripple
      can :manage, ::Deposits::Peercoin
      can :manage, ::Deposits::Namecoin
      can :manage, ::Deposits::Monero
      can :manage, ::Deposits::Realpointcoin
      can :manage, ::Deposits::Tritiumcoin

      can :menu, Withdraw
      can :manage, ::Withdraws::Bank
      can :manage, ::Withdraws::Satoshi
      can :manage, ::Withdraws::Blackcoin
      can :manage, ::Withdraws::Litecoin
      can :manage, ::Withdraws::Dashcoin
      can :manage, ::Withdraws::Zcash
      can :manage, ::Withdraws::Ripple
      can :manage, ::Withdraws::Peercoin
      can :manage, ::Withdraws::Namecoin
      can :manage, ::Withdraws::Monero
      can :manage, ::Withdraws::Realpointcoin
      can :manage, ::Withdraws::Tritiumcoin
    end
  end
end