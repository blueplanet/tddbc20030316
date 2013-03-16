class Ltsv
  def initialize
    @hash = {}
  end

  def set(key, value)
    raise ArgumentError if key.nil? or key.empty?
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
