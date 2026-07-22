import subprocess
import os
import urllib.parse
from gi.repository import Nautilus, GObject

class VSCodeMenuProvider(GObject.GObject, Nautilus.MenuProvider):
    def get_file_items(self, *args):
        files = args[-1]
        paths = []
        for f in files:
            uri = f.get_uri()
            path = urllib.parse.unquote(uri.replace("file://", ""))
            paths.append(path)

        item = Nautilus.MenuItem(
            name="VSCodeExtension::open_vscode",
            label="Abrir no VS Code",
            tip="Abrir no Visual Studio Code",
        )
        item.connect("activate", self._open_vscode, paths)
        return [item]

    def get_background_items(self, *args):
        folder = args[-1]
        uri = folder.get_uri()
        path = urllib.parse.unquote(uri.replace("file://", ""))

        item = Nautilus.MenuItem(
            name="VSCodeExtension::open_vscode_bg",
            label="Abrir no VS Code",
            tip="Abrir esta pasta no Visual Studio Code",
        )
        item.connect("activate", self._open_vscode, [path])
        return [item]

    def _open_vscode(self, menu, paths):
        subprocess.Popen(["code", "--new-window"] + paths)
