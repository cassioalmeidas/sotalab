class ProjectDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end


  # Just an example of a complex method you can add to you decorator
  # To render it in a datatable just add a column 'dt_actions' in
  # 'view_columns' and 'data' methods and call record.decorate.dt_actions
  def dt_actions

    links = []
    links << h.link_to(h.project_path(object), class: 'btn btn-success mx-1') do 
      h.fa_icon 'rocket', text: h.t('explore')
    end
    links << h.link_to(h.edit_project_path(object), class: 'btn btn-primary mx-1') do 
      h.fa_icon 'edit', text: h.t('edit')
    end
    links << h.link_to(h.project_path(object), method: :delete, remote: true, class: 'btn btn-danger', data: h.dataConfirm) do 
      h.fa_icon 'remove', text: h.t('remove')
    end
    h.safe_join(links, '')
  end  
end
