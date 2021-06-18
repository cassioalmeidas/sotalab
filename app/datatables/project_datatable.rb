class ProjectDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Project.id", cond: :eq },
      name: { source: "Project.name", cond: :like },
      created_at: { source: "Project.created_at", cond: :like },
      dt_actions:  { source: 'dt_actions', orderable: false, searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        created_at: I18n.l(record.created_at, format: :short),
        dt_actions: record.decorate.dt_actions
      }
    end
  end

  def get_raw_records
    # insert query here
    Project.all
  end

end
