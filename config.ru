require './config/environment'


use Rack::MethodOverride

use BrewLogsController
use SessionsController
use RecipesController
use UsersController
run ApplicationController
