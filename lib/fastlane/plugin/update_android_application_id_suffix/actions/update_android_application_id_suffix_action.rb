require 'fastlane/action'
require_relative '../helper/update_android_application_id_suffix_helper'

module Fastlane
  module Actions
    class UpdateAndroidApplicationIdSuffixAction < Action
      def self.run(params)
        path = params[:path]
        suffix = params[:suffix]

        foundSuffix = false

        data = File.read(path)
        updated_data = data
        data.each_line do |line|
            if (line.start_with?("def APPLICATION_ID_SUFFIX"))
              foundSuffix = true
              updated_data = updated_data.gsub(line, "def APPLICATION_ID_SUFFIX=#{suffix}\r\n")
            end
        end

        if (!foundSuffix)
          UI.error "APPLICATION_ID_SUFFIX not found in build.gradle file, please ensure file contains 'def APPLICATION_ID_SUFFIX' declaration"
          raise "Illegal Argument Exception : No APPLICATION_ID_SUFFIX variable in build.gradle file"
        end

        File.open(path, "w") do |f|
          f.write(updated_data)
        end

        UI.message "Android application ID suffix updated to #{suffix}"
        return true

      end

      def self.description
        "Update android application id suffix"
      end

      def self.authors
        ["Shalon Teoh"]
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :path,
                               description: "Path to your version.properties file",
                               optional: false),
            FastlaneCore::ConfigItem.new(key: :suffix,
                              description: "Application ID suffix value to update",
                              optional: false)
       ]
      end

      def self.example_code
        [
            'update_android_application_id_suffix(
                path: "/path/to/version.properties"
                suffix: ".example_shop"
            )'
        ]
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
