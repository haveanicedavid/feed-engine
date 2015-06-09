class UserMailer < ApplicationMailer

  def daily_digest_email(user)
    @user = user
    @searches = user.searches
    mail(to: "patrickmedaugh@gmail.com", subject: "Twitter Analyses")
  end
end
