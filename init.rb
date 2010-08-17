require 'redmine'

Redmine::Plugin.register :redmine_issue_status_colors do
  name 'Issue Status Colors'
  author 'Eric Davis'
  description 'Adds extra css classes for the issue status'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  version '0.1.0'

  requires_redmine :version_or_higher => '0.9.0'
end
