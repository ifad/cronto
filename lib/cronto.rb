require 'open3'

module Cronto
  VERSION = '0.1.0'

  extend self

  def self.jar
    File.dirname(File.realpath(__FILE__)) + '/../out/artifacts/cronto_jar/cronto.jar'
  end

  def generate(*args)
    out, err, status = Open3.capture3(['java', 'cronto'], '-jar', jar, *args)

    if status.success?
      return out
    else
      raise err
    end
  end

  def run(*args)
    puts generate(*args)
  end
end
