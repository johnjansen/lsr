require "option_parser"
require "./lsr/*"

module Lsr
  a = false
  aa = false
  author = false

  bb = false

  ff = false

  d = false
  dd = false

  g = false
  gg = false

  l = false
  ll = false

  n = false
  nn = false

  o = false

  ino = false
  s = false
  # one = false

  OptionParser.parse! do |parser|
    parser.banner = "Usage: lsr [OPTION]... [FILE_REGEX]..."
    parser.on("-a", "--all", "do not ignore entries starting with .") { a = true }
    parser.on("-A", "--almost-all", "do not list implied . and ..") { a = true; aa = true }
    parser.on("-B", "--ignore-backups", "do not list implied entries ending with ~") { bb = true }
    parser.on("-d", "--directory", "list directories themselves, not their contents") { d = true }
    parser.on("-D", "--ignore-directories", "do not list directories") { dd = true }

    # parser.on("-D", "--dired", "generate output designed for Emacs' dired mode") { puts "NOT IMPLEMENTED" }                                                                                                               # TODO implement
    # parser.on("-f", "do not sort, enable -aU, disable -ls --color") { puts "NOT IMPLEMENTED" }                                                                                                                            # TODO implement
    # parser.on("-F", "--classify", "append indicator (one of */=>@|) to entries") { puts "NOT IMPLEMENTED" }                                                                                                               # TODO implement
    # parser.on("--file-type", "likewise, except do not append '*'") { puts "NOT IMPLEMENTED" }                                                                                                                             # TODO implement
    # parser.on("--format=WORD", "across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C") { |word| puts "NOT IMPLEMENTED" }                                                               # TODO implement
    # parser.on("--full-time", "like -l --time-style=full-iso") { puts "NOT IMPLEMENTED" } # TODO implement

    parser.on("-g", "like -l, but do not list owner") { l = true; g = true }

    parser.on("--group-directories-first", "group directories before files; can be augmented with a --sort option, but any use of --sort=none (-U) disabled grouping") { puts "NOT IMPLEMENTED" } # TODO implement

    parser.on("-G", "--no-group", "in a long listing, don't print group names") { l = true; gg = true }

    # parser.on("-h", "--human-readable", "with -l and/or -s, print human readable sizes (e.g., 1K 234M 2G)") { puts "NOT IMPLEMENTED" }                                                            # TODO implement
    # parser.on("--si", "likewise, but use powers of 1000 not 1024") { puts "NOT IMPLEMENTED" }                                                                                                     # TODO implement
    # parser.on("--indicator-style=WORD", "append indicator with style WORD to entry names: none  (default), slash (-p), file-type (--file-type), classify (-F)") { puts "NOT IMPLEMENTED" }        # TODO implement

    parser.on("-i", "--inode", "print the index number of each file") { ino = true }
    parser.on("-l", "use a long listing format") { l = true }
    parser.on("-L", "--dereference", "when showing file information for a symbolic link, show information for the file the link references rather than for the link itself") { ll = true }

    parser.on("-m", "fill width with a comma seperated list of entries") { puts "NOT IMPLEMENTED" } # TODO implement

    parser.on("-n", "--numeric-uid-gid", "like -l, but list numeric user and group IDs") { n = true }
    parser.on("-N", "--literal", "print entry names without quoting") { nn = true }
    parser.on("-o", "like -l, but do not list group information") { o = true }

    parser.on("-p", "--indicator-style=slash", "append / indicator to directories") { |indicator| puts "NOT IMPLEMENTED" }                                        # TODO implement
    parser.on("-q", "--hide-control-chars", "print ? instead of nongraphic characters") { puts "NOT IMPLEMENTED" }                                                # TODO implement
    parser.on("--show-control-chars", "show nongraphic characters as-is (the default, unless program is 'ls' and output is terminal)") { puts "NOT IMPLEMENTED" } # TODO implement
    parser.on("-Q", "--quote-name", "enclose entry names in double quotes") { puts "NOT IMPLEMENTED" }                                                            # TODO implement
    # parser.on("--quoting-style=WORD", "use quoting style WORD for entry names: literal, locale, shell, shell-always, shell-escape, shell-escape-always, c, escape") { puts "NOT IMPLEMENTED" }          # TODO implement
    parser.on("-r", "--reverse", "reverse order while sorting") { puts "NOT IMPLEMENTED" } # TODO implement
    # parser.on("-R", "--recursive", "list sub directories") { puts "NOT IMPLEMENTED" }                                                                                                                   # TODO implement

    parser.on("-s", "--size", "print the allocated size of each file, in blocks") { s = true }

    parser.on("-S", "sort by file size, largest first") { puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                                                                                          # TODO implement
    parser.on("--sort=WORD", "sort by WORD instead of name: none (-U), size (-S), time (-T), version (-V), extension (-X)") { puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                      # TODO implement
    parser.on("--time=WORD", "with -l, show time as WORD instead of default modification time: atime or access or use (-u); ctime or status (-c); also use specified time as sort key if --sort=time (newest first)") { puts "NOT IMPLEMENTED" }                                                                                                                                            # TODO implement
    parser.on("--time-style=WORD", "with -l, show times using style STYLE: full-iso, long-iso, iso, locale, or +FORMAT; FORMAT is interpreted like in 'date'; if FORMAT is FORMAT1<newline>FORMAT2, then FORMAT1 applies to non-recent files and FORMAT2 to recent files; if STYLE is prefixed with 'posix-', STYLE takes effect only outside the POSIX locale") { puts "NOT IMPLEMENTED" } # TODO implement
    parser.on("-t", "sort by modification time, newest first") { puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                                                                                   # TODO implement
    # parser.on("-T", "--tabsize=COLS", "assume tab stops at each COLS instead of 8") { |tabsize| puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                                                    # TODO implement
    parser.on("-u", "with -lt: sort by, and show, access time; with -l: show access time and sort by name; otherwise: sort by access time, newest first") { puts "NOT IMPLEMENTED" } # TODO implement
    parser.on("-U", "do not sort; list entries in directory order") { puts "NOT IMPLEMENTED" }                                                                                       # TODO implement
    parser.on("-v", "natural sort of (version) numbers within text") { puts "NOT IMPLEMENTED" }                                                                                      # TODO implement
    # parser.on("-w", "--width=COLS", "set output width to COLS.  0 means no limit") { |cols| puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                                                        # TODO implement
    # parser.on("-x", "list entries by lines instead of by columns") { puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                                                                               # TODO implement
    parser.on("-X", "sort alphabetically by entry extension") { puts "NOT IMPLEMENTED" } # TODO implement
    # parser.on("-Z", "--context", "print any security context of each file") { puts "NOT IMPLEMENTED" }                                                                                                                                                                                                                                                                                      # TODO implement
    # parser.on("-1", "list one file per line.  Avoid '\\n' with -q or -b") { one = true }

    parser.on("--help", "display this help and exit") { puts parser; exit }
    parser.on("--version", "output version information and exit") { puts parser; exit }
  end

  ARGV << ".*" if ARGV.empty?
  xpr = ARGV.first.split("/").map { |a| Regex.new(a) }
  {% unless env("CRYSTAL_ENV") == "test" %}
    blocks = 0

    paths = [] of Tuple(String, File::Stat)
    LS.new(xpr).each do |t|
      paths << t
    end

    line = String.build do |string|
      paths.each do |path, stat|
        begin
          next if path.starts_with?('.') && !a
          next if path.ends_with?('~') && bb
          next if (path == "." || path == "..") && aa
          if dd
            next if stat.directory?
            if stat.symlink?
              next if File.stat(File.real_path(path)).directory?
            end
          elsif d && stat.symlink?
            next unless File.stat(File.real_path(path)).directory?
          elsif d
            next unless stat.directory?
          end

          if ll && stat.symlink?
            stat = File.lstat(File.real_path(path))
          end

          blocks += stat.blocks

          mode = stat.mode.to_s(8)
          ftype = mode[0]

          if l
            # LONG FORMAT
            # -rw-r--r--@   1 johnjansen  staff    5096132 Mar 11  2016 2014-01-03.zip
            # -rw-r--r--@   1 johnjansen  staff   16019803 Mar 11  2016 2014-01-10.zip
            # drwx------    6 johnjansen  staff        204 Aug 30  2016 Applications
              if ino
                string << stat.ino
                string << " "
              end
              if s
                string << stat.blocks
                string << " "
              end
              string << stat.ls_perms
              string << " "
              string << stat.nlink
              string << " "
              unless g
                string << (n ? stat.uid : User.from(stat.uid).strip)
                string << "  "
              end
              unless o
                string << (gg || n ? stat.gid : Group.from(stat.gid).strip)
                string << "  "
              end
              string << stat.size
              string << "\t"
              # 2017-07-11 16:00:14 UTC
              string << stat.ctime.to_local.to_s("%b %d %H:%M")
              string << " "
              string << path
              if stat.symlink?
                string << " -> "
                string << File.real_path(path)
              end
              string << '\n'
          else
            string << path
            string << '\n'
          end
        rescue e
          string << '"' if nn
          string << e.message
          string << '"' if nn
          string << '\n'
        end
      end
    end
    puts "Total #{blocks}" if l
    puts line

  {% end %}
end
