require 'development_mail_interceptor.rb'
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
