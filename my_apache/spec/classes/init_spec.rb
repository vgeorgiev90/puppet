require 'spec_helper'
describe 'my_apache' do
  context 'with default values for all parameters' do
    it { should contain_class('my_apache') }
  end
end
