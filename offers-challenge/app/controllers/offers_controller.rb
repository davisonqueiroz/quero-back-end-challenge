class OffersController < ApplicationController
  def index
    @offers = Offer.all
    render json: @offers, each_serializer: OfferSerializer

  end
end
