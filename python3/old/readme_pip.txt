

pip3 install -U 패키지명

pip3 install -U jupyter

pip3 list --format=columns --outdated
pip3 list --format=legacy --outdated
pip3 list --format=json --outdated


Usage:
  pip install [options] <requirement specifier> [package-index-options] ...
  pip install [options] -r <requirements file> [package-index-options] ...
  pip install [options] [-e] <vcs project url> ...
  pip install [options] [-e] <local project path> ...
  pip install [options] <archive url/path> ...

Description:
  Install packages from:

  - PyPI (and other indexes) using requirement specifiers.
  - VCS project urls.
  - Local project directories.
  - Local or remote source archives.

  pip also supports installing from "requirements files", which provide
  an easy way to specify a whole environment to be installed.

Install Options:
  -c, --constraint <file>     Constrain versions using the given constraints file. This option can be used multiple times.
  -e, --editable <path/url>   Install a project in editable mode (i.e. setuptools "develop mode") from a local project path or a VCS url.
  -r, --requirement <file>    Install from the given requirements file. This option can be used multiple times.
  -b, --build <dir>           Directory to unpack packages into and build in.
  -t, --target <dir>          Install packages into <dir>. By default this will not replace existing files/folders in <dir>. Use --upgrade
                              to replace existing packages in <dir> with new versions.
  -d, --download <dir>        Download packages into <dir> instead of installing them, regardless of what's already installed.
  --src <dir>                 Directory to check out editable projects into. The default in a virtualenv is "<venv path>/src". The default
                              for global installs is "<current dir>/src".
  -U, --upgrade               Upgrade all specified packages to the newest available version. The handling of dependencies depends on the
                              upgrade-strategy used.
  --upgrade-strategy <upgrade_strategy>
                              Determines how dependency upgrading should be handled. "eager" - dependencies are upgraded regardless of
                              whether the currently installed version satisfies the requirements of the upgraded package(s). "only-if-
                              needed" -  are upgraded only when they do not satisfy the requirements of the upgraded package(s).
  --force-reinstall           When upgrading, reinstall all packages even if they are already up-to-date.
  -I, --ignore-installed      Ignore the installed packages (reinstalling instead).
  --ignore-requires-python    Ignore the Requires-Python information.
  --no-deps                   Don't install package dependencies.
  --install-option <options>  Extra arguments to be supplied to the setup.py install command (use like --install-option="--install-
                              scripts=/usr/local/bin"). Use multiple --install-option options to pass multiple options to setup.py install.
                              If you are using an option with a directory path, be sure to use absolute path.
  --global-option <options>   Extra global options to be supplied to the setup.py call before the install command.
  --user                      Install to the Python user install directory for your platform. Typically ~/.local/, or %APPDATA%\Python on
                              Windows. (See the Python documentation for site.USER_BASE for full details.)
  --egg                       Install packages as eggs, not 'flat', like pip normally does. This option is not about installing *from*
                              eggs. (WARNING: Because this option overrides pip's normal install logic, requirements files may not behave
                              as expected.)
  --root <dir>                Install everything relative to this alternate root directory.
  --prefix <dir>              Installation prefix where lib, bin and other top-level folders are placed
  --compile                   Compile py files to pyc
  --no-compile                Do not compile py files to pyc
  --no-use-wheel              Do not Find and prefer wheel archives when searching indexes and find-links locations. DEPRECATED in favour
                              of --no-binary.
  --no-binary <format_control>
                              Do not use binary packages. Can be supplied multiple times, and each time adds to the existing value. Accepts
                              either :all: to disable all binary packages, :none: to empty the set, or one or more package names with
                              commas between them. Note that some packages are tricky to compile and may fail to install when this option
                              is used on them.
  --only-binary <format_control>
                              Do not use source packages. Can be supplied multiple times, and each time adds to the existing value. Accepts
                              either :all: to disable all source packages, :none: to empty the set, or one or more package names with
                              commas between them. Packages without binary distributions will fail to install when this option is used on
                              them.
  --pre                       Include pre-release and development versions. By default, pip only finds stable versions.
  --no-clean                  Don't clean up build directories.
  --require-hashes            Require a hash to check each requirement against, for repeatable installs. This option is implied when any
                              package in a requirements file has a --hash option.

Package Index Options (including deprecated options):
  -i, --index-url <url>       Base URL of Python Package Index (default https://pypi.python.org/simple). This should point to a repository
                              compliant with PEP 503 (the simple repository API) or a local directory laid out in the same format.
  --extra-index-url <url>     Extra URLs of package indexes to use in addition to --index-url. Should follow the same rules as --index-url.
  --no-index                  Ignore package index (only looking at --find-links URLs instead).
  -f, --find-links <url>      If a url or path to an html file, then parse for links to archives. If a local path or file:// url that's a
                              directory, then look for archives in the directory listing.
  --process-dependency-links  Enable the processing of dependency links.

General Options:
  -h, --help                  Show help.
  --isolated                  Run pip in an isolated mode, ignoring environment variables and user configuration.
  -v, --verbose               Give more output. Option is additive, and can be used up to 3 times.
  -V, --version               Show version and exit.
  -q, --quiet                 Give less output. Option is additive, and can be used up to 3 times (corresponding to WARNING, ERROR, and
                              CRITICAL logging levels).
  --log <path>                Path to a verbose appending log.
  --proxy <proxy>             Specify a proxy in the form [user:passwd@]proxy.server:port.
  --retries <retries>         Maximum number of retries each connection should attempt (default 5 times).
  --timeout <sec>             Set the socket timeout (default 15 seconds).
  --exists-action <action>    Default action when a path already exists: (s)witch, (i)gnore, (w)ipe, (b)ackup, (a)bort.
  --trusted-host <hostname>   Mark this host as trusted, even though it does not have valid or any HTTPS.
  --cert <path>               Path to alternate CA bundle.
  --client-cert <path>        Path to SSL client certificate, a single file containing the private key and the certificate in PEM format.
  --cache-dir <dir>           Store the cache data in <dir>.
  --no-cache-dir              Disable the cache.
  --disable-pip-version-check
                              Don't periodically check PyPI to determine whether a new version of pip is available for download. Implied
                              with --no-index.


Usage:
  pip list [options]

Description:
  List installed packages, including editables.

  Packages are listed in a case-insensitive sorted order.

List Options:
  -o, --outdated              List outdated packages
  -u, --uptodate              List uptodate packages
  -e, --editable              List editable projects.
  -l, --local                 If in a virtualenv that has global access, do not list globally-installed packages.
  --user                      Only output packages installed in user-site.
  --pre                       Include pre-release and development versions. By default, pip only finds stable versions.
  --format <list_format>      Select the output format among: legacy (default), columns, freeze or json.
  --not-required              List packages that are not dependencies of installed packages.

Package Index Options (including deprecated options):
  -i, --index-url <url>       Base URL of Python Package Index (default https://pypi.python.org/simple). This should point to a repository
                              compliant with PEP 503 (the simple repository API) or a local directory laid out in the same format.
  --extra-index-url <url>     Extra URLs of package indexes to use in addition to --index-url. Should follow the same rules as --index-url.
  --no-index                  Ignore package index (only looking at --find-links URLs instead).
  -f, --find-links <url>      If a url or path to an html file, then parse for links to archives. If a local path or file:// url that's a
                              directory, then look for archives in the directory listing.
  --process-dependency-links  Enable the processing of dependency links.

General Options:
  -h, --help                  Show help.
  --isolated                  Run pip in an isolated mode, ignoring environment variables and user configuration.
  -v, --verbose               Give more output. Option is additive, and can be used up to 3 times.
  -V, --version               Show version and exit.
  -q, --quiet                 Give less output. Option is additive, and can be used up to 3 times (corresponding to WARNING, ERROR, and
                              CRITICAL logging levels).
  --log <path>                Path to a verbose appending log.
  --proxy <proxy>             Specify a proxy in the form [user:passwd@]proxy.server:port.
  --retries <retries>         Maximum number of retries each connection should attempt (default 5 times).
  --timeout <sec>             Set the socket timeout (default 15 seconds).
  --exists-action <action>    Default action when a path already exists: (s)witch, (i)gnore, (w)ipe, (b)ackup, (a)bort.
  --trusted-host <hostname>   Mark this host as trusted, even though it does not have valid or any HTTPS.
  --cert <path>               Path to alternate CA bundle.
  --client-cert <path>        Path to SSL client certificate, a single file containing the private key and the certificate in PEM format.
  --cache-dir <dir>           Store the cache data in <dir>.
  --no-cache-dir              Disable the cache.
  --disable-pip-version-check
                              Don't periodically check PyPI to determine whether a new version of pip is available for download. Implied
                              with --no-index.
