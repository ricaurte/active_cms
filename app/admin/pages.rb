# encoding: utf-8
ActiveAdmin.register ActiveCms::Page, :as => 'CmsPage' do
  
  form do |f|
    f.inputs I18n.t("active_cms.pages.fields.sections.basic"), :class => 'basic' do
      
      f.input :title, :label => I18n.t("active_cms.pages.fields.title")
      f.input :slug, :label => I18n.t("active_cms.pages.fields.slug")
      
      f.input :body, :label => I18n.t("active_cms.pages.fields.body"), :input_html => { :class => :ckeditor }
    end

    f.inputs I18n.t("active_cms.pages.fields.sections.settings"), :class => 'settings' do
      f.input :parent_id, :as => :select, :collection => ActiveCms::Page::tree(params[:id]), :label => I18n.t("active_cms.pages.fields.parent_id")
      f.input :skip, :label => I18n.t("active_cms.pages.fields.skip")
      f.input :menu, :label => I18n.t("active_cms.pages.fields.menu")
      f.input :redirect, :label => I18n.t("active_cms.pages.fields.redirect")
    end
    
    f.inputs I18n.t("active_cms.pages.fields.sections.meta"), :class => 'meta' do
      f.input :meta_title, :label => I18n.t("active_cms.pages.fields.meta_title")
      f.input :meta_keywords, :label => I18n.t("active_cms.pages.fields.meta_keywords")
      f.input :meta_description, :label => I18n.t("active_cms.pages.fields.meta_description")
    end
    
    f.buttons
  end
  
  menu :label => proc{ I18n.t("active_cms.pages.label") }
  
  show :title => :show_title do |page|
    h3 page.title
    div do
      simple_format page.body
    end
  end
  
  index do
    column '', :skip_icon, :sortable => false
    column '', :redirect_icon, :sortable => false
    column '', :menu_icon, :sortable => false
    column I18n.t("active_cms.pages.index.header.title"), :title, :sortable => false
    column I18n.t("active_cms.pages.index.header.slug"), :slug, :sortable => false
    column I18n.t("active_cms.pages.index.header.link"), :link, :sortable => false
    default_actions
  end
  
  sidebar proc{ I18n.t("active_cms.pages.label") }, :only => :show do 
    render :partial => "admin/pages/show_sidebar"
  end
  
end