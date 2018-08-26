module Helper

end

class Array
  def keep(&block)
    temp = self.select(&block)
    temp
  end
end