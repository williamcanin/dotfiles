#!/usr/bin/env python3
from dbus import SessionBus, Interface, DBusException

spaces = 5
trunclen = 20  # coloquei maior p/ mostrar mais do título
mplayer = 'org.mpris.MediaPlayer2.{}'

try:
    session_bus = SessionBus()

    # tenta pegar o serviço
    spotify_bus = session_bus.get_object(
        mplayer.format('spotify'),
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get(
        mplayer.format('Player'),
        'Metadata'
    )

    artist = metadata.get('xesam:artist', [''])[0]
    song = metadata.get('xesam:title', '')

    if len(song) > trunclen:
        song = song[0:trunclen] + '...'
        if '(' in song and ')' not in song:
            song += ')'

    print(f'{" "*spaces} [ {artist}: {song} ]')

except DBusException:
    # quando o Spotify não estiver rodando
    print(" [ No player ]")
