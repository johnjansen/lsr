class OptionParser
  BK = '\n' + (" " * 38)

  private def append_flag(flag, description)
    ct = 0
    bk_desc = String.build do |s|
      description.split(/\s+/) do |chunk|
        ct += chunk.size
        if ct > 43
          s << BK
          s << chunk
          ct = chunk.size
        elsif ct > 0
          s << ' '
          s << chunk
        else
          s << chunk
        end
      end
    end
    description = bk_desc

    if flag.size >= 33
      @flags << "    #{flag}\n#{" " * 37}#{description}"
    else
      @flags << "    #{flag}#{" " * (33 - flag.size)}#{description}"
    end
  end
end
