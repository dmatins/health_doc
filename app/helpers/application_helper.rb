module ApplicationHelper
  def link_to_new(name, url, html_options = {})
    default_html_options = { class: "text-success", title: "Create new item" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "plus"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def link_to_edit(name, url, html_options = {})
    default_html_options = { class: "text-warning", title: "Edit this item" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "edit"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def link_to_show(name, url, html_options = {})
    default_html_options = { class: "text-info", title: "View this item" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "eye"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def link_to_destroy(name, url, html_options = {})
    default_html_options = { class: "text-danger", title: "Annihilate this item", method: :delete, data: { confirm: 'Are you sure?' } }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "remove"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def button_to_new(name, url, html_options = {})
    default_html_options = { class: "btn btn-success" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "plus"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def button_to_edit(name, url, html_options = {})
    default_html_options = { class: "btn btn-warning" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "edit"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def button_to_destroy(name, url, html_options = {})
    default_html_options = { class: "btn btn-danger", method: :delete, data: { confirm: 'Are you sure?' } }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "remove"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def button_to_back(name, url, html_options = {})
    default_html_options = { class: "btn btn-primary" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "mail-reply"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

  def button_to_show(name, url, html_options = {})
    default_html_options = { class: "btn btn-info" }
    link_to url, default_html_options.merge(html_options) do
      concat fa_icon "eye"
      concat content_tag :span, name, style: "padding-left: 5px" if name.present?
    end
  end

end
