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
      "#{key}:#{value.gsub(":", "\\:").gsub("\t", "\\t").gsub("\n", "\\n")}"
    end.join("\t") + "\n"
  end

  def self.parse(dump)
    ltsv = new
    dump.strip.split("\t").each do |pair|
      key, value = pair.split(":")
      ltsv.set(key, value)
    end

    ltsv
  end
end
