module RedmineIssueStatusColors
  module Patches
    module IssuePatch
      def self.included(base)
        base.extend(ClassMethods)

        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          alias_method_chain :css_classes, :status_name
        end
      end

      module ClassMethods
      end

      module InstanceMethods
        def css_classes_with_status_name
          s = css_classes_without_status_name
          if status.name.present?
            status_name = status.name.downcase.gsub(/[^\w]/,'-')
            s << " status-#{status_name}"
          end
          s
        end
      end
    end
  end
end
