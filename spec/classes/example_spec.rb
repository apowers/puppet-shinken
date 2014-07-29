require 'spec_helper'

describe 'shinken' do
  let(:title) { 'shinken' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "shinken class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('shinken') }
      it { should create_package('shinken') }
      it { should create_file('/etc/shinken.conf') }
      it {
        should create_file('/etc/shinken.conf')\
        .with_content(/^server pool.shinken.org$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('shinkend') }
      else
        it { should create_service('shinken') }
      end
    end
  end
end
