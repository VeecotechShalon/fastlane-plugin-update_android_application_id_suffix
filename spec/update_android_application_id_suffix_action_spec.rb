describe Fastlane::Actions::UpdateAndroidApplicationIdSuffixAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The update_android_application_id_suffix plugin is working!")

      Fastlane::Actions::UpdateAndroidApplicationIdSuffixAction.run(nil)
    end
  end
end
