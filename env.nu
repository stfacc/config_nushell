let theme_color1_bold_ansi = "1;38;2;0;95;135m"
let theme_color4_ansi = "0;38;2;183;43;39m"
let theme_color4_bold_ansi = "1;38;2;183;43;39m"

def create_left_prompt [] {
    let dir = ([
        ($env.PWD | str substring 0..($env.HOME | str length) | str replace $env.HOME "~"),
        ($env.PWD | str substring ($env.HOME | str length)..)
    ] | str join)

    let path_color = (if (is-admin) { ansi red_bold } else { ansi -e $theme_color1_bold_ansi })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi dark_gray })
    let path_segment = $"($path_color)($dir)" | str replace --all (char path_sep) $"($separator_color)/($path_color)"

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {
        $" (ansi -e $theme_color4_bold_ansi)($env.LAST_EXIT_CODE)(ansi reset) "
    } else { "" }

    [$path_segment $last_exit_code] | str join
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { null }

$env.PROMPT_INDICATOR = {|| $"(ansi -e $theme_color4_ansi)❯ " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi -e $theme_color4_ansi)❯ " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi -e $theme_color4_ansi): " }
$env.PROMPT_MULTILINE_INDICATOR = {|| $"(ansi -e $theme_color4_ansi)::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
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
