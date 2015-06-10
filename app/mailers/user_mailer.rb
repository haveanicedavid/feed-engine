class UserMailer < ApplicationMailer

  def daily_digest_email(user, analysis)
    @user = user
    @analysis = analysis
    mail(to: @user.email , subject: "Tweetsum #{@analysis.keyword.capitalize} Analyses")
  end
end
