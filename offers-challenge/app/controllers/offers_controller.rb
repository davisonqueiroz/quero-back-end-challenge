class OffersController < ApplicationController
  def index
    @offers = FilteredOffersQuery.new(params).call
    render json: @offers, each_serializer: OfferSerializer

  end
end
