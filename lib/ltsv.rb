class Ltsv
  def initialize
    @hash = {}
  end

  def set(key, value)
    raise ArgumentError, "key is blank" if key.nil? or key.empty?
    raise ArgumentError, "value is nil" if value.nil?
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
