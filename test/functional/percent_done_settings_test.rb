require File.expand_path('../../test_helper', __FILE__)

class PercentDoneSettingsTest < ActionController::TestCase
  tests SettingsController
  fixtures :users, :issue_statuses

  setup do
    session[:user_id] = 1
  end

  test 'should render settings' do
    get :plugin, params: { id: 'redmine_percent_done' }
    assert_response :success
    IssueStatus.all.each do |status|
      assert_select 'label', status.name
      assert_select 'select[name=?]', "settings[status-#{status.id}]"
    end
  end

  test 'should store settings' do
    settings = {}
    IssueStatus.all.each do |status|
      settings["status-#{status.id}"] = '20'
    end

    post :plugin, params: { id: 'redmine_percent_done', settings: settings }
    assert_response :redirect
    assert settings = Setting.plugin_redmine_percent_done
    settings.values.each do |v|
      assert_equal v, '20'
    end
  end

end

