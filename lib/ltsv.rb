class Ltsv
  def initialize
    @hash = {}
  end

  def set(key, value)
    tmp = @hash[key]
    @hash[key] = value
    tmp
  end

  def get(key)
    @hash[key]
  end

  def dump
    @hash.map do |key, value|
      "#{key}:#{value}"
    end.join + "\n"
  end
end
