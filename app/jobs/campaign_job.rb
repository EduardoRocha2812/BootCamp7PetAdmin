class CampaignJob < ApplicationJob
  queue_as :emails

  def perform(client, title, body)
    # Do something later
    # o método é deliver_now porque estamos enviando os emails em jobs -> estamos enfileirando!
    MarketingMailer.campaign(client, title, body).deliver_now
  end
end
