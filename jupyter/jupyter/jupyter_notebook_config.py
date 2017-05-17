#------------------------------------------------------------------------------
# NotebookApp(JupyterApp) configuration
#------------------------------------------------------------------------------

## extra paths to look for Javascript notebook extensions
#c.NotebookApp.extra_nbextensions_path = []

## The IP address the notebook server will listen on.
c.NotebookApp.ip = '*'

## Dict of Python modules to load as notebook server extensions.Entry values can
#  be used to enable and disable the loading ofthe extensions. The extensions
#  will be loaded in alphabetical order.
#c.NotebookApp.nbserver_extensions = {}

## The directory to use for notebooks and kernels.
c.NotebookApp.notebook_dir = '/home/jupyter/notebooks'

## Whether to open in a browser after starting. The specific browser used is
#  platform dependent and determined by the python standard library `webbrowser`
#  module, unless it is overridden using the --browser (NotebookApp.browser)
#  configuration option.
c.NotebookApp.open_browser = False

## Hashed password to use for web authentication.
#  To generate, type in a python/IPython shell:
#    from notebook.auth import passwd; passwd()
#  The string should be of the form type:salt:hashed-password.
#c.NotebookApp.password = ''

## Forces users to use a password for the Notebook server. This is useful in a
#  multi user environment, for instance when everybody in the LAN can access each
#  other's machine though ssh.
#
#  In such a case, server the notebook server on localhost is not secure since
#  any user can connect to the notebook server via ssh.
#c.NotebookApp.password_required = False

## The number of additional ports to try if the specified port is not available.
c.NotebookApp.port_retries = 0

## Token used for authenticating first-time connections to the server.
#
#  When no password is enabled, the default is to generate a new, random token.
#
#  Setting to an empty string disables authentication altogether, which is NOT
#  RECOMMENDED.
#c.NotebookApp.token = '<generated>'

## Whether to trust or not X-Scheme/X-Forwarded-Proto and X-Real-Ip/X-Forwarded-
#  For headerssent by the upstream reverse proxy. Necessary if the proxy handles
#  SSL
c.NotebookApp.trust_xheaders = True

## Username for the Session. Default is your system username.
#c.Session.username = 'jupyter'
