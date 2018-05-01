include_recipe 'chocolatey::default'

chocolatey_source 'MySource' do
  source 'http://example.com/something'
  action :add
end

chocolatey_source 'BogusSource' do
  action :remove
end

chocolatey_source 'Add MySource2' do
  source_name 'MySource2'
  source 'http://example.com/something2'
  action :add
end

chocolatey_source 'Remove MySource2' do
  source_name 'MySource2'
  source 'http://example.com/something2'
  action :remove
end
