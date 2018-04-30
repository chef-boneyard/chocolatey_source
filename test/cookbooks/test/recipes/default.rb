include_recipe 'chocolatey::default'

# this is really a bug in the chocolatey cookbook
windows_path 'C:\ProgramData\chocolatey\bin'

chocolatey_source 'MySource' do
  source 'http://example.com/something'
end
