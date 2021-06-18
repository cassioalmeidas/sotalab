module ApplicationHelper
  def nav_bar
    content_tag(:ul, class: 'nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0') do 
      yield
    end
  end
  
  def nav_link(text, path)
    options = current_page?(path) ? { class: 'nav-link px-2 text-secondary' } : { class: 'nav-link px-2 text-white' }
    content_tag(:li) do 
      link_to(path, options) do 
        text.html_safe
      end
    end
  end
  

  def dataConfirm
    {
      confirm_swal: I18n.t('are_you_sure')
    }
  end
end
