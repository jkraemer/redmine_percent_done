require File.expand_path('../../test_helper', __FILE__)

class PercentDoneSettingsTest < ActionController::TestCase
  tests SettingsController
  fixtures :users, :issue_statuses

  setup do
    session[:user_id] = 1
  end

  test 'should render settings' do
    get :plugin, id: 'redmine_percent_done'
    assert_response :success
    IssueStatus.all.each do |status|
      assert_select 'label', status.name
      assert_select "select[name=\"settings[status-#{status.id}]\"]"
    end
  end

end

