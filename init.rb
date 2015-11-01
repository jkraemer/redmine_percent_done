require_dependency 'redmine_percent_done'

Redmine::Plugin.register :redmine_percent_done do
  name 'Redmine Issue Done Ratio Plugin'
  url  'http://redmine-search.com/percent-done'

  description 'Automatic issue done ratios for selected issue statuses, keeping the field editable manually.'

  author     'Jens Krämer'
  author_url 'https://jkraemer.net/'

  version '1.0.0'

  requires_redmine version_or_higher: '2.6.0'
end

Rails.configuration.to_prepare do
  RedminePercentDone.setup
end

