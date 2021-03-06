class UserMailer < ActionMailer::Base
  default from: "robot@Stabstr.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_price_quote.subject
  #
  def send_price_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.request.user.email, subject: 'New price quote on Stabstr'
  end

  def accepted_price_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.user.email, subject: 'Your price quote was accepted'
  end

  def inform_about_rejected_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.request.user.email, cc: @price_quote.user.email 
  end

  def new_comment(from, to, comment)
		puts "In new_comment:"
    puts "GOT #{from.inspect} " 
    puts "GOT #{to.inspect}" 
    puts "GOT #{comment.inspect}"
    @from    = from
    @to      = to
    @comment = comment

    mail to: @to.email #, from: @from.email
  end

end
