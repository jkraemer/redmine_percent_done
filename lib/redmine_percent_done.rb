module RedminePercentDone
  def self.setup
    IssuePatch.apply
  end

  def self.percent_done_for_status_id(id)
    unless (percent_done = Setting.plugin_redmine_percent_done["status-#{id}"]).blank?
      percent_done.to_i
    end
  end
end
