require 'spec_helper'
describe 'server_hardening' do
  context 'with default values for all parameters' do
    it { should contain_class('server_hardening') }
  end
end
