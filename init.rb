# frozen_string_literal: true

Redmine::Plugin.register :redmine_sample_data do
  name 'Redmine sample data'
  url 'https://github.com/alphanodes/redmine_sample_data'
  description 'Create sample data for performance tests'
  version '1.0.0'
  author 'Alexander Meindl'
  requires_redmine version_or_higher: '5.0'
end
