config.load_autoconfig()

c.tabs.position = "left"
c.tabs.width = "10%"
c.auto_save.session = True

# observer handler in qutebrowser
from qutebrowser.api import interceptor
import subprocess

def observer_interceptor(info: interceptor.Request):
    url = info.request_url.toString()  # convert QUrl to string
    if url.startswith("observer://"):
        # ensure it has a hostname
        parts = url.split("://", 1)
        scheme, rest = parts
        if '/' not in rest:
            url = f"{scheme}://localhost/{rest}"
        # launch observer via OS handler
        subprocess.Popen(["xdg-open", url])
        # prevent qutebrowser from opening the link itself
        info.block()

interceptor.register(observer_interceptor)
