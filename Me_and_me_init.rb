# Redmine sample plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Repository Maintenance Plugin for RedMine'

Redmine::Plugin.register :repository_maintenance_plugin do
  name 'Repository Maintenance plugin'
  author 'Kusno Mudiarto'
  description 'This is a plugin to maintain the repository'
  version '0.0.1'
  settings :default => {'vcs' => 'value', 'foo'=>'bar'}, :partial => 'settings/settings'

  # This plugin adds a project module
  # It can be enabled/disabled at project level (Project settings -> Modules)
  project_module :example_module do
    # A public action
    permission :example_say_hello, {:example => [:say_hello]}, :public => true
    # This permission has to be explicitly given
    # It will be listed on the permissions screen
    permission :example_say_goodbye, {:example => [:say_goodbye]}
  end

  # A new item is added to the project menu
  menu :project_menu, :sample_plugin, { :controller => 'example', :action => 'say_hello' }, :caption => 'Sample'
end
