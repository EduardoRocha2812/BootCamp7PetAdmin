class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { finished: 0, canceled: 1 }
  validates :client, presence: true

  belongs_to :discount
  belongs_to :client
  
  #Não vai existir esta interface do lado produto (-> é uma Venda que adiciona um produto)
  # dependent destroy deleta dados dependentes... evita erro de integridade
  has_many :sell_products, dependent: :destroy
  has_many :products, through: :sell_products
  #Não vai existir esta interface do lado serviço (-> é uma Venda que adiciona um serviço)
  has_many :sell_services, dependent: :destroy
  has_many :services, through: :sell_services
  
  before_save :set_total 

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  private
  def set_total
    total = 0
    discount_total = 0 
    self.products.each{|p| total += p.price}
    self.services.each{|s| total += s.price}
    # verifica desconto
    if self.discount.present?
      discount_total = (self.discount.discount_type)? (self.discount.value/100 * total) : self.discount.value 
      total -= discount_total
    end
    total = (total >=0)? total : 0
    self.total = total 
  end

end