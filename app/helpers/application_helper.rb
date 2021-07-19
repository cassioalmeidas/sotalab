module ApplicationHelper
  def nav_bar
    content_tag(:ul, class: 'nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0') do 
      yield
    end
  end
  
  def nav_link(text, path="#")
    options = current_page?(path) ? { class: 'nav-link px-2 text-secondary' } : { class: 'nav-link px-2 text-white' }
    content_tag(:li) do 
      link_to(path, options) do 
        text.html_safe
      end
    end
  end

  
  def locale_selector(locale)
    flag = locale.to_s.size <= 2 ? locale.to_s : locale[3..4].downcase.to_s
    link = content_tag(:span, '', class: "flag-icon flag-icon-#{flag} me-1") + I18n.t(I18n.locale)
    content_tag(:div, class: 'dropdown') do
      concat(link_to(link, "#",  role: 'button', id: "dropdown-locale-selector", "data-bs-toggle": "dropdown", "aria-expanded": "false"))
      concat(content_tag(:ul, class: 'dropdown-menu', "aria-labelledby": "dropdown-locale-selector") do 
        I18n.available_locales.each do |locale|
          concat(content_tag(:li) do
            link_to(I18n.t(locale), url_for(locale: locale), class: "dropdown-item")
          end)
        end
      end)
    end

  end


  def dataConfirm
    {
      confirm_swal: I18n.t('are_you_sure')
    }
  end
end
