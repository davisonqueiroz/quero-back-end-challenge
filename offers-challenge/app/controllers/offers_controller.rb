class OffersController < ApplicationController
  def index
    @offers = Offer.all
    render json: @offers, serializer: OfferSerializer

  end
end
