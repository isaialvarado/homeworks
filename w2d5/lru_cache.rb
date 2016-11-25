class LRUCache

  def initialize(capacity)
    @cache = []
    @capacity = capacity
  end

  def count
    @cache.size
  end

  def add(data)
    if in_cache?(data)
      update_most_recently_used(data)
    else
      remove_from_cache(least_recently_used) if max_capacity?
      add_to_cache(data)
    end
  end

  def show
    print @cache
  end

  private

  def add_to_cache(data)
    @cache.push(data)
  end

  def remove_from_cache(data)
    @cache.delete(data)
  end

  def max_capacity?
    count == @capacity
  end

  def in_cache?(data)
    @cache.include?(data)
  end

  def least_recently_used
    @cache.first
  end

  def update_most_recently_used(data)
    remove_from_cache(data)
    add_to_cache(data)
  end
end
