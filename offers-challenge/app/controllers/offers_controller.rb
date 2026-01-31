class OffersController < ApplicationController
  def index
    relation = FilteredOffersQuery.new(params).call
    pagy, offers = pagy(
      relation,
      page: params[:page],
      items: items_per_page
    )

    render json: offers,
           each_serializer: OfferSerializer,
           meta: pagination_meta(pagy)
  end

  private

  def items_per_page
    if params[:per_page].present?
      params[:per_page].to_i
    end
  end
  
  def pagination_meta(pagy)
    {
      page: pagy.page,
      per_page: pagy.items,
      total_pages: pagy.pages,
      total_items: pagy.count,
      next_page: pagy.next,
      prev_page: pagy.prev
    }
  end
end
