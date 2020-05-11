# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Fix for rails-erd
if Rails.env.development?
  Zeitwerk::Loader.eager_load_all
end
