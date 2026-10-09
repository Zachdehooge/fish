# Only bridge the Flatpak Discord socket if it exists and a native Discord hasn't created a real socket
if test -S $XDG_RUNTIME_DIR/app/com.discordapp.Discord/discord-ipc-0; and not test -S $XDG_RUNTIME_DIR/discord-ipc-0
    ln -sf $XDG_RUNTIME_DIR/app/com.discordapp.Discord/discord-ipc-0 $XDG_RUNTIME_DIR/discord-ipc-0
end
