ActiveAdmin.register ActiveCms::Page do

  form :partial => "admin/pages/pages_form"
  
  menu :label => I18n.t("active_cms.pages.label")
  
  index do
    column :title
    column :slug
    default_actions
  end
  
end
