require './config/environment'
require 'sinatra/flash'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use WineController
use UserController
run ApplicationController
