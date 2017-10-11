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

end
