# YaSQL

## Requirements

### Perl 5

This was developed with Perl 5.16. Any earlier version of Perl 5 may or may not
work.  Perl 4 will definitely not work.

### Unix Environment

YaSQL was developed under GNU/Linux, and aimed at as many Unix installations as
possible.  Known to be compatible with GNU/Linux, AIX and Sun Solaris.  Please
inform the author if it works for other platforms.  I would be especially
interested if it worked on Win32.

### Oracle Server

It has been tested and developed for Oracle 9i, 11g, and 12c. The author can
currently only support 12c, so bugs may be filed bearing this in mind.

### Oracle Client Libraries

The Oracle client libraries must be installed for `DBD::Oracle`.  Of course you
can’t install `DBD::Oracle` without them.

### `DBD::Oracle`

`DBD::Oracle` must be installed since this uses DBI for database connections.

### `ORACLE_HOME`

The `ORACLE_HOME` environment variable must be set if you use a connection
descriptor to connect so that YaSQL can translate the descriptor into useful
connection information to make the actual connection.

### `Term::Readline`

`Term::Readline` must be installed (it is with most Perl installations), but
more importantly, installing `Term::ReadLine::Gnu` from CPAN will greatly
enhance the usability.

### `Time::HiRes`

This is used for high resolution benchmarking.

### `Term::ReadKey`

This module is used for better input and output control.

### `Text::CSV`

This module is used for CSV input and output.

## Installation

* `make [options]`

The following options are used by Makefile:

| Option          | Description                                                       |
| --------------- | ----------------------------------------------------------------- |
| `prefix=PREFIX` | install architecture-independent files in `PREFIX` [`/usr/local`] |
| `PERL=`         | path to the `perl` binary                                         |
| `SHELL=`        | path to a POSIX shell                                             |

* `make [options] install`

* Manual

Manual installation by placing `yasql.in` in a directory on your `$PATH` as
`yasql`, with the extension stripped, and `yasql.conf` at `/usr/local/etc/`.

## Etc.

Type `man yasql` for usage instructions.

Type `yasql` to run it!

Get the latest version from [GitLab](http://gitlab.com/ankitpati/yasql "YaSQL")!
