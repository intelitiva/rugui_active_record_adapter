require File.dirname(__FILE__) + '/../rugui_active_record_installer'

namespace :rara do
  desc 'Creates the db directory and database configuration file.'
  task :install do
    installer = RuGUI::ActiveRecord::Installer.new
    installer.install
    puts "RuGUI ActiveRecord Adapter was successfully installed!"
  end

  desc 'Destroy the db directory and database configuration file.'
  task :uninstall do
    installer = RuGUI::ActiveRecord::Installer.new
    installer.uninstall
    puts "RuGUI ActiveRecord Adapter was successfully destroyed!"
  end

  desc 'Destroy and create(again) the db directory and database configuration file.'
  task :reinstall do
    installer = RuGUI::ActiveRecord::Installer.new
    installer.reinstall
    puts "RuGUI ActiveRecord Adapter was successfully reinstalled!"
  end
end
