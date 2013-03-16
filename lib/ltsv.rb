class Ltsv
  def initialize
    @hash = {}
  end

  def set(key, value)
    @hash[key] = value
    nil
  end

  def get(key)
    @hash[key]
  end
end
