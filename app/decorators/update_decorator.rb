class UpdateDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def attendence_rate_in_percent
    "#{object.attendence_rate*100}%"
  end

  def family_income_in_unit
    "$ #{object.family_income} 盧比"
  end

  def weight_in_unit
    "#{object.weight}kg"
  end

  def height_in_unit
    "#{object.height}cm"
  end

  def rounded_study_hours
    "#{"%g" % ("%.2f" % (object.study_hours*10).to_s)} 小時"
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
