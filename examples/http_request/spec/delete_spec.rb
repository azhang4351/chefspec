require 'chefspec'

describe 'http_request::delete' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'deletes a http_request with an explicit action' do
    expect(chef_run).to delete_http_request('explicit_action')
    expect(chef_run).to_not delete_http_request('not_explicit_action')
  end

  it 'deletes a http_request with attributes' do
    expect(chef_run).to delete_http_request('with_attributes').with(url: 'http://my.url')
    expect(chef_run).to_not delete_http_request('with_attributes').with(url: 'http://my.other.url')
  end

  it 'deletes a http_request when specifying the identity attribute' do
    expect(chef_run).to delete_http_request('identity_attribute')
  end
end
