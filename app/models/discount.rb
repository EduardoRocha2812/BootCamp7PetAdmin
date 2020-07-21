class Discount < ApplicationRecord
  include Fae::BaseModelConcern
  enum discount_type: { value: 0, percent: 1 }
  
  validates :title, uniqueness: true, presence: true

  validates :value, presence: true
  
  def fae_display_field
    title
  end

end
