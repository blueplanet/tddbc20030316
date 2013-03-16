class Ltsv
  def initialize
    @hash = {}
  end

  def set(key, value)
    tmp = @hash.delete(key)
    @hash[key] = value
    tmp
  end

  def get(key)
    @hash[key]
  end

  def dump
    @hash.map do |key, value|
      "#{key}:#{value}"
    end.join("\t") + "\n"
  end
end
