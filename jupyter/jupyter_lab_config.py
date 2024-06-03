import os
from jupyter_server.auth import passwd

c = get_config()

# IPとポートの設定
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = int(os.getenv('JUPYTER_PORT', 8888))

# パスワード認証の設定
with open('/run/secrets/jupyter_password') as f:
    password = f.read().strip()
c.ServerApp.password = passwd(password)
c.ServerApp.open_browser = False
c.ServerApp.allow_root = True