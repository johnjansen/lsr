require "option_parser"

host = ""
username = ""
password = ""

a = false
bb = false
d = false
dd = false
l = false
n = false
g = false
o = false
tt = false
qq = false
prefix = ""
netrc_file_path = nil
out_dir = nil

filter : Regex? = nil

OptionParser.parse! do |parser|
  parser.banner = ""
  parser.on("-h", "--host=HOST", "the host to connect to") { |h| host = h }
  parser.on("-u", "--user=USER", "the username to connect with") { |user| username = user }
  parser.on("-p", "--pass=PASS", "the password to connect with") { |pass| password = pass }
  parser.on("-n", "look for a netrc file for credentials") { n = true }
  parser.on("--netrc-file=FILE", "use a netrc format file for credentials, at the given path") { |path| netrc_file_path = path }
  parser.on("--out-dir=DIR", "use an output directory, at the given path") { |path| out_dir = path }

  parser.on("-B", "--ignore-backups", "do not list implied entries ending with ~") { bb = true }
  parser.on("-d", "--directory", "list directories themselves, not their contents") { d = true }
  parser.on("-D", "--ignore-directories", "do not list directories") { dd = true }

  parser.on("-g", "like -l, but do not list owner") { l = true; g = true }
  parser.on("-l", "use a long listing format") { l = true }
  parser.on("-o", "like -l, but do not list group information") { o = true }

  parser.on("-Q", "--quote-name", "enclose entry names in double quotes") { qq = true }
  parser.on("--prefix-name=PREFIX", "add a prefix to the name") { |pf| prefix = pf }
  parser.on("--absolutize", "absolutize the urls") { a = true }

  parser.on("-f", "--filter=FILTER", "filter the list on the supplied regular expression") { |f| filter = Regex.new(f) }

  parser.on("-T", "sort by time") { tt = true }

  parser.on("--help", "display this help and exit") { puts parser; exit }
  parser.on("--version", "output version information and exit") { puts parser; exit }
end

command = "curl -sS"
command += " -n" if n && netrc_file_path.nil?
command += " --netrc-file #{netrc_file_path.not_nil!}" unless netrc_file_path.nil?
command += " #{host} --user #{username}:#{password}"

`#{command}`.each_line do |line|
  begin
    perms, _, line = line.partition(/\s+/)
    nlinks, _, line = line.partition(/\s+/)
    user, _, line = line.partition(/\s+/)
    group, _, line = line.partition(/\s+/)
    size, _, line = line.partition(/\s+/)
    time = Time.parse(Time.utc_now.year.to_s + ' ' + line[0..11].gsub(/\s+/, " "), "%Y %b %d %k:%M") # Jul 18 13:14
    file = line[13..-1]

    next if perms[0] == 'd' && !dd
    next if perms[0] == '-' && d
    next if filter.is_a?(Regex) && file.not_nil! !~ filter

    if l || g || o
      STDOUT << perms
      STDOUT << ' '
      STDOUT << nlinks.to_i
      STDOUT << ' '
      unless g
        STDOUT << user
        STDOUT << ' '
      end
      unless o
        STDOUT << group
        STDOUT << ' '
      end
      STDOUT << size.to_i64
      STDOUT << ' '
      STDOUT << time
      STDOUT << ' '
    end
    STDOUT << prefix
    STDOUT << '"' if qq
    STDOUT << host if a
    STDOUT << file
    STDOUT << '"' if qq
    unless out_dir.nil?
      STDOUT << " -n" if n && netrc_file_path.nil?
      STDOUT << " --netrc-file #{netrc_file_path.not_nil!}" unless netrc_file_path.nil?
      STDOUT << " --create-dirs"
      STDOUT << " -o "
      STDOUT << File.join(out_dir.not_nil!, File.basename(file))
    end
    STDOUT << '\n'
  rescue e
    puts e.message
    puts line
  end
end
