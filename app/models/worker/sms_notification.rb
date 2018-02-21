module Worker
  require 'excon'
  class SmsNotification

    def process(payload, metadata, delivery_info)
      payload.symbolize_keys!

      raise "TWILIO_NUMBER not set" if ENV['TWILIO_NUMBER'].blank?

      puts "TWILIO Number TWilio"
      # twilio_client.account.sms.messages.create(
      #   from: ENV["TWILIO_NUMBER"],
      #   to:   Phonelib.parse(payload[:phone]).international,
      #   body: payload[:message]
      # )
      authkey = ENV['SMSAUTHKEY']
      sender  = ENV['SENDER']
      route   = ENV['ROUTE']
      country = ENV['COUNTRY']
      mobiles = Phonelib.parse(payload[:phone]).international
      puts Phonelib.parse(payload[:phone]).national
      puts Phonelib.parse(payload[:phone]).international
      mobiles = mobiles.delete(' ')
      raise ArgumentError, 'Please set authkey, sender, route && country for MSG91 API' unless authkey && sender && route && country

      params = { :authkey => authkey, :mobiles => mobiles, :message => payload[:message], 
                 :sender => sender, :route => route, :country => country }
      puts URI.encode_www_form(params)
      res = Excon.get('http://api.msg91.com/api/sendhttp.php', :query => URI.encode_www_form(params))
      puts res.body
      if res.status == 200
        res.body
      else
        Rails.logger.error(res.body)                          
        raise Errors::SMSNotSent, res.body
      end
    end

    def twilio_client
      Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"], ssl_verify_peer: false
    end

  end
end