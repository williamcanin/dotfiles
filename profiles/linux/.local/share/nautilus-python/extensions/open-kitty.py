import subprocess
import urllib.parse
from gi.repository import Nautilus, GObject

class OpenKittyExtension(GObject.GObject, Nautilus.MenuProvider):
    def get_file_items(self, files):
        if len(files) == 1 and files[0].is_directory():
            path = urllib.parse.unquote(files[0].get_uri()[7:])
            return self._make_item(path)
        return []

    def get_background_items(self, folder):
        path = urllib.parse.unquote(folder.get_uri()[7:])
        return self._make_item(path)

    def _make_item(self, path):
        item = Nautilus.MenuItem(
            name="OpenKitty::open",
            label="Abrir no Kitty",
            tip="Abrir o Kitty neste diretório",
        )
        item.connect("activate", lambda *_: subprocess.Popen(["kitty"], cwd=path))
        return [item]
