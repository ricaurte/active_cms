ActiveAdmin.setup do |config|

  def set_admin_locale
    I18n.locale = :de
  end

  config.register_javascript 'ckeditor/ckeditor.js'
  
  config.before_filter :set_admin_locale

end