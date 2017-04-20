# coding: UTF-8
require_dependency 'redmine_percent_done'

Redmine::Plugin.register :redmine_percent_done do
  name 'Redmine Issue Done Ratio Plugin'
  url  'http://redmine-search.com/redmine-issue-done-ratio-plugin'

  description 'Automatic issue done ratios for selected issue statuses, keeping the field editable manually.'

  author     'Jens Krämer'
  author_url 'https://jkraemer.net/'

  version '1.1.0'

  requires_redmine version_or_higher: '2.6.0'

  settings partial: 'settings/redmine_percent_done', default: {}
end

Rails.configuration.to_prepare do
  RedminePercentDone.setup
end

