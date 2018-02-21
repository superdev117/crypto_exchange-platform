class Token::Activation < ::Token
  after_create :send_token

  def confirm!
    super
    member.active!
  end

  private

  def send_token
    puts 12312312
    puts member.email
    TokenMailer.activation(member.email, token).deliver
  end
end
