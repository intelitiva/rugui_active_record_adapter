module RuGUI
  module ActiveRecord
    class Installer
      # Install the RuGUI ActiveRecord Adapter
      # Creates the db directory and the database configuration file
      # in APPLICATION_ROOT/config/database.yml
      def install
        unless installed?
          create_database_directory
          create_database_configuration_file
        end
      end

      # Uninstall the RuGUI ActiveRecord Adapter
      def uninstall
        if installed?
          destroy_database_directory
          destroy_database_configuration_file
        end
      end

      # Uninstall and install (again) the RuGUI ActiveRecord Adapter
      def reinstall
        uninstall and install
      end

      # Check if the database configuration file was created.
      # This file is in APPLICATION_ROOT/config/database.yml
      def installed?
        File.exists?(database_configuration_file)
      end

      protected
        # Creates the database directory in APPLICATION_ROOT/db
        def create_database_directory
          FileUtils.mkdir(database_directory)
        end

        # Creates the database configuration file in APPLICATION_ROOT/config/database.yml
        def create_database_configuration_file
          FileUtils.cp(database_configuration_sample, database_configuration_file)
        end

        # Destroy the database directory
        def destroy_database_directory
          FileUtils.remove_dir(database_directory)
        end

        # Destroy the database configuration file
        def destroy_database_configuration_file
          FileUtils.rm(database_configuration_file)
        end

      private
        def database_directory
          File.join(APPLICATION_ROOT, 'db')
        end

        def database_configuration_file
          File.join(APPLICATION_ROOT, 'config', 'database.yml')
        end

        def database_configuration_sample
          File.join(APPLICATION_ROOT, 'vendor', 'plugins', 'rugui_active_record_adapter', 'lib', 'samples', 'database.yml')
        end
    end
  end
end
