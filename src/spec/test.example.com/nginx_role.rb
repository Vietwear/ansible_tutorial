require 'spec_helper'
require 'yaml'
describe package('nginx'), :if => os[:family] == 'ubuntu' 
do
  it { should be_installed }
end
describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end
