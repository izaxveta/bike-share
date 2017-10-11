module ModelDashboardFormatter

  def order_by_child_count(child_name, order = 'DESC')
    group(:id).joins(child_name).order("COUNT(#{child_name}) #{order}")
  end

  def ordered_groups_by_count(field, order = 'DESC')
    group(field).order("COUNT(id) #{order}").count
  end

  def child_counts_descending(child_name)
    order_by_child_count(child_name).count.values
  end

  def by_chunk(field, step)
    start_group = minimum(field)
    last = maximum(field)
    final = {}
    until start_group > last
      end_group = start_group + step
      range = start_group...end_group
      final[range] = yield where(field => range)
      start_group = end_group
    end
    final
  end

end
