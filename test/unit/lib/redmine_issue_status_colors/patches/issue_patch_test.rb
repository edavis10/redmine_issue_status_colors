require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineIssueStatusColors::Patches::IssueTest < ActionController::TestCase
  context "Issue" do
    subject { Issue.new }

    context "#css_classes" do
      setup do
        @issue = Issue.new(:priority => IssuePriority.generate!(:type => 'IssuePriority', :position => 1))
      end
      
      should "include the status name" do
        @issue.status = IssueStatus.generate!(:name => 'nameofstatus')
        assert_match /status-nameofstatus/, @issue.css_classes
      end
      
      should "lowercase the status name" do
        @issue.status = IssueStatus.generate!(:name => 'UpperCaseStatus')
        assert_match /status-uppercasestatus/, @issue.css_classes
      end

      should "replace any non alphanumeric characters with hyphens" do
        @issue.status = IssueStatus.generate!(:name => "Development Status 15 - ABC'")
        assert_match /status-development-status-15---abc-/, @issue.css_classes
      end
      
    end
  end
  
end
