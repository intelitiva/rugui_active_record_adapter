require File.dirname(__FILE__) + '/lib/rugui_active_record_adapter'

database_adapter = RuGUI::ActiveRecord::Adapter.new
database_adapter.initialize_database
