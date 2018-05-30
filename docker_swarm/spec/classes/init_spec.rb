require 'spec_helper'
describe 'docker_swarm' do
  context 'with default values for all parameters' do
    it { should contain_class('docker_swarm') }
  end
end
