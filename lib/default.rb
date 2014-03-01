include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

module DateHelper
  def pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end
end

include DateHelper

module Pager
  def get_page(items, page)
    offset = items_per_page * (page - 1)
    limit = items_per_page
    items.slice offset, limit
  end

  private

  def items_per_page
    10
  end
end

include Pager
