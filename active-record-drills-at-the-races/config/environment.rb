require "active_record"
require "rake"
require "sqlite3"
require "pathname"

path_to_root_directory = File.expand_path('../../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)

APP_NAME = APP_ROOT.basename.to_s

model_files = Dir[APP_ROOT.join('app', 'models', '*.rb')]

model_files.each do |model_file|
  filename = File.basename(model_file, ".*")
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

ActiveRecord::Base.logger = if ENV['AR_ENV'] == 'test'
                              nil
                            else
                              Logger.new(STDOUT)
                            end

database_config = if ENV['AR_ENV'] == 'test'
                    { :adapter  =>  "sqlite3",
                      :database => "#{APP_ROOT}/db/test-database.sqlite3" }
                  else
                    { :adapter  =>  "sqlite3",
                      :database => "#{APP_ROOT}/db/database.sqlite3" }
                  end

ActiveRecord::Base.establish_connection(database_config)

ActiveRecord::Base.connection
