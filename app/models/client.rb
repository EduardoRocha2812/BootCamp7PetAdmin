class Client < ApplicationRecord
  include Fae::BaseModelConcern
  
  validates :phone, presence: true
  validates :email, 
    uniqueness: true,
    presence: true,
    format: {
      with: Fae.validation_helpers.email_regex,
      message: 'You need to provide a valide and unique email!'
    }
  
  def fae_display_field
    name
  end

end
