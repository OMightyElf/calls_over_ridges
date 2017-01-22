class PostDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def publish_date
  	object.publish_date.try(:strftime, "%Y/%m/%d")
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
