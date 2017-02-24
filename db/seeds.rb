# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

['reading_report_amount.greater_than', 'reading_report_amount.equals_to', 'reading_report_amount.less_than',
'grade.greater_than', 'grade.equals_to', 'grade.less_than',
'family_income.greater_than', 'family_income.equals_to', 'family_income.less_than',
'weight.greater_than', 'weight.equals_to', 'weight.less_than',
'height.greater_than', 'height.equals_to', 'height.less_than',
'study_hours.greater_than', 'study_hours.equals_to', 'study_hours.less_than',
'how_many_children_to_be_supported', 'how_many_dreamers', 'aurora.description',
'aurora.button_state', 'aurora.button_description', 'aurora.link'].each do |var|
  Setting.create(
    {
      var: var,
      value: ""
    }
  )
end