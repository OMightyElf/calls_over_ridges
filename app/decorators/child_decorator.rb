class ChildDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def support_length
    ((Time.now - object.supported_at) / 1.day).to_i
  end

  def support_days_left
    ((object.support_until - Time.now) / 1.day).to_i
  end

  def age
    ((Time.now - object.birthday) / 1.year).to_i
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
