class Comment# < ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  #belongs_to :price_quote
  #belongs_to :user
  #validates_presence_of :price_quote
  validates_presence_of :user

  after_save :send_email

  private
  def send_email
    return unless price_quote.present?
    if price_quote.request.user != user
      to   = price_quote.request.user
      from = price_quote.user
    else 
      to   = price_quote.user
      from = price_quote.request.user
    end
    UserMailer.new_comment(from,to, self).deliver
  end

end
