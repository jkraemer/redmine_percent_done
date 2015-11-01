module RedminePercentDone
  module IssuePatch

    def self.apply
      Issue.class_eval do
        # using prepend instead of include makes life much easier when you have
        # to override already existing methods. Death to alias_method_chain!
        prepend InstanceMethods
        before_save :update_done_ratio_for_status
      end unless Issue < InstanceMethods # no need to do this more than once.
    end

    module InstanceMethods
      def update_done_ratio_for_status
        return unless status_id_changed? && !done_ratio_changed?
        if new_percent_done = RedminePercentDone.percent_done_for_status_id(status_id)
          self.done_ratio = new_percent_done
        end
      end
      private :update_done_ratio_for_status
    end

  end
end
