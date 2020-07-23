class MarketingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.marketing_mailer.campaign.subject
  #
=begin
  def campaign
    @greeting = "Hi"

    mail to: "to@example.org"
  end
=end

  def campaign(client, title, body)
    @body = body
    mail to: client.email, subject: title
  end

end
