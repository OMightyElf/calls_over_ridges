class UserDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def support_length
    ((Time.now.to_i - object.support_start.to_i) / 1.day).to_i
  end

  def support_days_left
    ((object.support_end.to_i - Time.now.to_i) / 1.day).to_i
  end

end
