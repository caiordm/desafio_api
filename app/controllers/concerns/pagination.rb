module Pagination
  extend ActiveSupport::Concern

  def default_page_size
    25
  end

  def page_no
    params[:page]&.to_i || 1
  end

  def page_size
    params[:page_size]&.to_i || default_page_size
  end

  def paginate_offset
    (page_no-1)*page_size
  end

  def paginate
    ->(it){ it.limit(page_size).offset(paginate_offset) }
  end
end