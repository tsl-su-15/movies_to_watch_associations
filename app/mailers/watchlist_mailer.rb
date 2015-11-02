class WatchlistMailer < ApplicationMailer
  def novice_level_achieved(user)
    @user = user
    mail(to: @user.email, subject: 'Congratulations' )
  end
end
