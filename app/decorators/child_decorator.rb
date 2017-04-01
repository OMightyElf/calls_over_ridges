class ChildDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def age
    ((Time.now.to_i - object.birthday.to_i) / 1.year).to_i
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
