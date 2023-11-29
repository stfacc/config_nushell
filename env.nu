let theme_color1_ansi = "0;38;2;0;95;135m"
let theme_color4_ansi = "0;38;2;183;43;39m"

$env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi -e $theme_color1_ansi)⭢ " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi -e $theme_color1_ansi)✀ " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    # ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.PATH = ($env.PATH | prepend ($env.HOME | path join .cargo/bin))

$env.EDITOR = hx
$env.LS_COLORS = "ex=01;38;2;95;135;0"

source ($nu.default-config-dir | path join env-local.nu)
