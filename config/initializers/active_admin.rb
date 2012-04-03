ActiveAdmin.setup do |config|

  def set_admin_locale
    I18n.locale = :de
  end

  config.register_stylesheet 'active_cms/application.css'
  config.register_javascript 'active_cms/application.js'
  config.register_javascript 'ckeditor/ckeditor.js'
  
  config.before_filter :set_admin_locale

end