module BikeShareQueries

  def order_by_child_count(child_name, order)
    group(:id).joins(child_name).order("COUNT(#{child_name}) #{order}")
  end

  def child_counts_descending(child_name)
    order_by_child_count(child_name, 'DESC').count.values
  end

  def breakout(child_name, field, step)
    by_chunk field, step do |chunk|
      counts = chunk.child_counts_descending(child_name)
      {
        max: counts.first,
        min: counts.last,
        avg: counts.sum / counts.size
      }
    end
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
