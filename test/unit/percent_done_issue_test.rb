require File.expand_path('../../test_helper', __FILE__)

class PercentDoneIssueTest < ActiveSupport::TestCase
  fixtures :projects, :enabled_modules, :issues, :users,
    :members, :member_roles, :roles, :trackers, :projects_trackers,
    :issue_statuses, :enumerations, :journals

  setup do
    @new = IssueStatus.find 1
    @resolved = IssueStatus.find 3
    Setting.plugin_redmine_percent_done = {
      'status-1' => '0',
      'status-2' => '',
      'status-3' => '100'
    }
  end

  test 'should get integer values for status id' do
    assert_equal 0, RedminePercentDone.percent_done_for_status_id(1)
    assert_nil RedminePercentDone.percent_done_for_status_id(2)
    assert_equal 100, RedminePercentDone.percent_done_for_status_id(3)
    assert_nil RedminePercentDone.percent_done_for_status_id(4)
  end

  test 'should update done ratio if set' do
    issue = Issue.find 1
    assert_equal 0, issue.done_ratio
    assert issue.update_attribute :status_id, 3
    issue.reload
    assert_equal 100, issue.done_ratio
  end

  test 'should not update done ratio if status not changed' do
    issue = Issue.find 1
    assert issue.update_attribute :status_id, 3
    issue.reload
    assert_equal 100, issue.done_ratio
    assert issue.update_attribute :done_ratio, 40
    issue.reload
    assert_equal 40, issue.done_ratio
    assert issue.update_attribute :subject, 'new subject'
    issue.reload
    assert_equal 40, issue.done_ratio
  end

  test 'should not change done ratio when invalid' do
    issue = Issue.find 1
    assert_equal 0, issue.done_ratio
    assert !(issue.update_attributes status_id: 3, subject: '')
    assert_equal 0, issue.done_ratio
  end

  test 'should not update done ratio if not set' do
    issue = Issue.find 2
    assert_equal 30, issue.done_ratio
    assert issue.update_attribute :status_id, 4
    issue.reload
    assert_equal 30, issue.done_ratio
  end

  test 'should not update done ratio if set to blank' do
    issue = Issue.find 2
    assert_equal 30, issue.done_ratio
    assert issue.update_attribute :status_id, 2
    issue.reload
    assert_equal 30, issue.done_ratio
  end

  test 'should set done ratio to zero' do
    issue = Issue.find 2
    assert_equal 30, issue.done_ratio
    assert issue.update_attribute :status_id, 1
    issue.reload
    assert_equal 0, issue.done_ratio
  end

  test 'should not change done ratio if manually set' do
    issue = Issue.find 2
    assert_equal 30, issue.done_ratio
    assert issue.update_attributes status_id: 1, done_ratio: 10
    issue.reload
    assert_equal 10, issue.done_ratio
  end
end
