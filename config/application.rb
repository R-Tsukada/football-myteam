require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Football
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.active_support.cache_format_version = 7.1
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    config.add_autoload_paths_to_load_path = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.eager_load_paths << Rails.root.join("extras")

    Rails.application.config.action_dispatch.default_headers = {
      "X-Frame-Options" => "SAMEORIGIN",
      "X-XSS-Protection" => "0",
      "X-Content-Type-Options" => "nosniff",
      "X-Permitted-Cross-Domain-Policies" => "none",
      "Referrer-Policy" => "strict-origin-when-cross-origin"
    }

    Rails.application.config.active_record.encryption.support_sha1_for_non_deterministic_encryption = false
    Rails.application.config.active_record.run_commit_callbacks_on_first_saved_instances_in_transaction = false
    Rails.application.config.active_record.sqlite3_adapter_strict_strings_by_default = true
    Rails.application.config.active_record.allow_deprecated_singular_associations_name = false
    Rails.application.config.active_job.use_big_decimal_serializer = true
    Rails.application.config.active_support.raise_on_invalid_cache_expiration_time = true
    Rails.application.config.active_support.message_serializer = :json_allow_marshal
    Rails.application.config.active_support.use_message_serializer_for_metadata = true
    if Rails.env.local?
      Rails.application.config.log_file_size = 100 * 1024 * 1024
    end
    Rails.application.config.active_record.raise_on_assign_to_attr_readonly = true
    Rails.application.config.active_record.belongs_to_required_validates_foreign_key = false
    Rails.application.config.precompile_filter_parameters = true
    Rails.application.config.active_record.before_committed_on_all_records = true
    Rails.application.config.active_record.default_column_serializer = nil
    Rails.application.config.active_record.marshalling_format_version = 7.1
    Rails.application.config.active_record.run_after_transaction_callbacks_in_order_defined = true
    Rails.application.config.active_record.commit_transaction_on_non_local_return = true
    Rails.application.config.active_record.generate_secure_token_on = :initialize
    Rails.application.config.action_view.sanitizer_vendor = Rails::HTML::Sanitizer.best_supported_vendor
    Rails.application.config.action_text.sanitizer_vendor = Rails::HTML::Sanitizer.best_supported_vendor
    Rails.application.config.action_dispatch.debug_exception_log_level = :error
    Rails.application.config.dom_testing_default_html_version = :html5
  end
end
