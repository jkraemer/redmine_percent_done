module RedminePercentDone
  module IssuePatch
    extend ActiveSupport::Concern

    prepended do
      before_save :update_done_ratio_for_status
    end

    def update_done_ratio_for_status
      return unless status_id_changed? && !done_ratio_changed?
      if new_percent_done = RedminePercentDone.percent_done_for_status_id(status_id)
        self.done_ratio = new_percent_done
      end
    end
    private :update_done_ratio_for_status
  end
end
