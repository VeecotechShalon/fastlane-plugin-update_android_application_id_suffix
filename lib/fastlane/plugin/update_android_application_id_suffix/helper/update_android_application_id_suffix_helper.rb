require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class UpdateAndroidApplicationIdSuffixHelper
      # class methods that you define here become available in your action
      # as `Helper::UpdateAndroidApplicationIdSuffixHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the update_android_application_id_suffix plugin helper!")
      end
    end
  end
end
