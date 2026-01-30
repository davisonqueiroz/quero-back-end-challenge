class FilteredOffersQuery
  def initialize(params, relation = Offer.all)
    @params = params
    @relation = relation
  end

  def call
    filter_by_kind
    filter_by_level
    filter_by_interval_price
    filter_by_course_name
    order_by
    @relation
  end

  private

  def filter_by_kind
    @relation = @relation.by_kind(@params[:kind]) if @params[:kind].present?
  end

  def filter_by_level
    @relation = @relation.by_level(@params[:level]) if @params[:level].present?
  end

  def filter_by_interval_price
    @relation = @relation.by_interval_price(@params[:min_price], @params[:max_price]) if @params[:min_price].present? && @params[:max_price].present?
  end

  def filter_by_course_name
    @relation = @relation.by_course_name(@params[:course_name]) if @params[:course_name].present?
  end

  def order_by
    if @params[:order].present?
      if @params[:direction].present? && ['asc','desc'].include?(@params[:direction])
        order_attribute = @params[:order]
        case order_attribute
        when 'name'
          @relation = @relation.order_by_name(@params[:direction])
        when 'offered_price'
          @relation = @relation.order_by_offered_price(@params[:direction])
        when 'rating'
          @relation = @relation.order_by_rating(@params[:direction])
        end
      end
    end
  end
end