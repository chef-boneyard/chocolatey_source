#
# Cookbook:: chocolatey_source
# resource:: chocolatey_source
#
# Copyright:: 2018, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

resource_name :chocolatey_source

property :source_name, String, name_property: true
property :source, String

# a few properties to add later
# property :user, String
# property :password, String
# property :cert, String
# property :cert_password, String
# property :bypass_proxy, [TrueClass, FalseClass]

action :add do
  raise "#{new_resource}: When adding a Chocolatey source you must pass the 'source' property!" unless new_resource.source

  execute choco_cmd('add')
end

action :remove do
  execute choco_cmd('remove')
end

action :enable do
  execute choco_cmd('enable')
end

action :disable do
  execute choco_cmd('disable')
end

action_class do
  def choco_cmd(action)
    cmd = "choco source #{action} -n #{new_resource.source_name}"
    if action == 'add'
     cmd << " -s #{new_resource.source}"
    end
  end
end
