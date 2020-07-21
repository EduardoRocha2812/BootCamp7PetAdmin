module Admin
  class DiscountsController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :update]

    def adjust_enum
      params[:discount][:discount_type] = params[:discount][:discount_type].to_i
    end
  end
end
