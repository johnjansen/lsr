require "benchmark"

class File
  struct Stat
    S_IRWXU  =  0o00700 # mask for file owner permissions
    S_IRUSR  =  0o00400 # owner has read permission
    S_IWUSR  =  0o00200 # owner has write permission
    S_IXUSR  =  0o00100 # owner has execute permission
    S_IRWXG  =  0o00070 # mask for group permissions
    S_IRGRP  =  0o00040 # group has read permission
    S_IWGRP  =  0o00020 # group has write permission
    S_IXGRP  =  0o00010 # group has execute permission
    S_IRWXO  =  0o00007 # mask for permissions for others (not in group)
    S_IROTH  =  0o00004 # others have read permission
    S_IWOTH  =  0o00002 # others have write permission
    S_IXOTH  =  0o00001 # others have execute permission
    S_IFMT   = 0o170000 # mask for file type
    S_IFIFO  = 0o010000 # FIFO (named pipe)
    S_IFCHR  = 0o020000 # character special (V7)
    S_IFMPC  = 0o030000 # multiplexed character special (V7)
    S_IFDIR  = 0o040000 # directory (V7)
    S_IFNAM  = 0o050000 # XENIX named special file with two subtypes, distinguished by st_rdev values 1, 2
    S_INSEM  = 0o000001 # XENIX semaphore subtype of IFNAM
    S_INSHD  = 0o000002 # XENIX shared data subtype of IFNAM
    S_IFBLK  = 0o060000 # block special (V7)
    S_IFMPB  = 0o070000 # multiplexed block special (V7)
    S_IFREG  = 0o100000 # regular (V7)
    S_IFCMP  = 0o110000 # VxFS compressed
    S_IFNWK  = 0o110000 # network special (HP-UX)
    S_IFLNK  = 0o120000 # symbolic link (BSD)
    S_IFSHAD = 0o130000 # Solaris shadow inode for ACL (not seen by userspace)
    S_IFSOCK = 0o140000 # socket (BSD; also "S_IFSOC" on VxFS)
    S_IFDOOR = 0o150000 # Solaris door
    S_IFWHT  = 0o160000 # BSD whiteout (not used for inode)
    S_ISVTX  = 0o001000 # sticky bit: save swapped text even after use (V7) reserved (SVID-v2). On non-directories: don’t cache this file (SunOS). On directories: restricted deletion flag (SVID-v4.2)
    S_ISGID  = 0o002000 # set-group-ID on execution (V7) for directories: use BSD semantics for propagation of GID
    S_ENFMT  = 0o002000 # SysV file locking enforcement (shared with S_ISGID)
    S_ISUID  = 0o004000 # set-user-ID on execution (V7)
    S_CDF    = 0o004000 # directory is a context dependent file (HP-UX)

    PERMS    = [{S_IRUSR, 'r'}, {S_IWUSR, 'w'}, {S_IXUSR, 'x'}, {S_IRGRP, 'r'}, {S_IWGRP, 'w'}, {S_IXGRP, 'x'}, {S_IROTH, 'r'}, {S_IWOTH, 'w'}, {S_IXOTH, 'x'}]
    FLAG_MAP = [{S_IFIFO, 'p'}, {S_IFCHR, 'c'}, {S_IFDIR, 'd'}, {S_INSEM, 's'}, {S_INSHD, 'm'}, {S_IFBLK, 'b'}, {S_IFREG, '-'}, {S_IFLNK, 'l'}, {S_IFNWK, 'n'}, {S_IFSOCK, 's'}, {S_IFDOOR, 'D'}, {S_IFWHT, 'w'}]

    def ls_perms
      String.build do |str|
        FLAG_MAP.each do |mask, abbr|
          if (S_IFMT & mode) == mask
            str << abbr
            break
          end
        end

        PERMS.each do |mask, abbr|
          str << (((mode & mask) > 0) ? abbr : '-')
        end
      end
    end
  end
end
