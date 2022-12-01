I18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}')]

# Permitted locales available for the application
I18n.available_locales = [:en, :de]

# Set default locale to something other than :en
I18n.default_locale = :en
