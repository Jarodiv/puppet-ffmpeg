require 'spec_helper'

describe 'ffmpeg' do
  # Parameter provided to the class when running the tests
  let(:params) do
    {
      'include_devel' => false
    }
  end

  on_supported_os.each do |os, facts|
    context os do
      let(:facts) do
        facts
      end

      # Tests for parameters defaults
      context 'default parameters' do
        it { is_expected.to compile.with_all_deps }

        # package 'ffmpeg::base_package' ('ffmpeg') should be present
        it { is_expected.to contain_package('ffmpeg') }
      end

      # Tests for parameters defaults
      context 'include devel package' do
        let(:params) do
          super().merge({ 'include_devel' => true })
        end

        it { is_expected.to compile.with_all_deps }

        # package 'ffmpeg::base_package' ('ffmpeg') should be present
        it { is_expected.to contain_package('ffmpeg') }

        # package 'ffmpeg::devel_package' ('ffmpeg-devel') should be present
        it { is_expected.to contain_package('ffmpeg-devel') }
      end
    end
  end
end
