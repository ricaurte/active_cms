# encoding: utf-8
ActiveAdmin.register ActiveCms::Page do
  
  form do |f|
    f.inputs "Details", :class => 'basic' do
      
      f.input :title
      f.input :slug
      
      f.input :body, :input_html => { :class => :ckeditor }
    end
    
    f.inputs "Eigenschaften", :class => 'settings' do
      f.input :parent_id, :as => :select, :collection => ActiveCms::Page::tree(), :label => 'Übergeordnete Seite'
      f.input :skip, :label => 'Automatisch auf untere Ebene weiterleiten?'
      f.input :menu, :label => 'Anzeige im Menü?'
      f.input :redirect, :label => 'Externe Weiterleitung'
    end
    
    f.inputs "Meta-Informationen", :class => 'meta' do
      f.input :meta_title, :label => 'Seiten-Titel'
      f.input :meta_keywords, :label => 'Keywords'
      f.input :meta_description, :label => 'Beschreibung'
    end
    
    f.buttons
  end
  
  menu :label => I18n.t("active_cms.pages.label")
  
  index do
    column :title
    column :slug
    column :link
    default_actions
  end
  
  sidebar I18n.t("active_cms.pages.sidebar_show.header"), :only => :show do
    render :partial => "admin/pages/show_sidebar"
  end
  
end
