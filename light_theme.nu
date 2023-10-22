let theme_color1 = "#005f87"  # dark blue
let theme_color2 = "#da2376"  # magenta: arguments, strings
let theme_color3 = "#8d68b9"  # purple: variable, int, float, bool
let theme_color4 = "#b72b27"  # red
let theme_color5 = "#db741a"  # orange
let theme_color6 = "#5f8700"  # green
let theme_color7 = "#0087af"  # blue

let theme_color4_ansi = "0;38;2;183;43;39m"
let theme_color4_bold_ansi = "1;38;2;183;43;39m"
let theme_color5_ansi = "0;38;2;219;116;26m"

let light_theme = {
    separator: dark_gray
    leading_trailing_space_bg: { attr: n }
    header: { fg: $theme_color1 attr: b }
    row_index: { fg: $theme_color1 attr: b }
    empty: blue
    bool: $theme_color3
    int: $theme_color3
    float: $theme_color3
    filesize: { fg: $theme_color7 attr: b }
    duration: dark_gray
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: $theme_color4 attr: "b" }
        } else if $in < 6hr {
            { fg: $theme_color5 attr: "b" }
        } else if $in < 1day {
            { fg: $theme_color6 attr: "b" }
        } else if $in < 4wk {
            $theme_color6
        } else if $in < 52wk {
            "dark_gray"
        } else {
            "gray"
        }
    }
    range: $theme_color5
    string: black
    nothing: green_bold
    binary: dark_gray
    cellpath: dark_gray
    record: dark_gray
    list: dark_gray
    block: dark_gray
    hints: dark_gray
    search_result: { fg: white bg: red }
    shape_block: { fg: $theme_color1 attr: b }
    shape_closure: { fg: $theme_color4 attr: b }
    shape_custom: green_bold
    shape_datetime: cyan_bold
    shape_directory: $theme_color2
    shape_internalcall: { fg: $theme_color1 attr: b }
    shape_external: $theme_color1
    shape_externalarg: $theme_color2
    shape_filepath: $theme_color2
    shape_flag: { fg: $theme_color7 attr: b }
    shape_garbage: { fg: "#ffffff" bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: { fg: $theme_color3 attr: b }
    shape_float: { fg: $theme_color3 attr: b }
    shape_bool: { fg: $theme_color3 attr: b }
    shape_list: $theme_color1
    shape_table: { fg: $theme_color1 attr: b }
    shape_record: $theme_color1
    shape_literal: green_bold
    shape_match_pattern: green_bold
    shape_matching_brackets: { attr: u }
    shape_nothing: green_bold
    shape_operator: { fg: $theme_color5 attr: b }
    shape_or: { fg: $theme_color5 attr: b }
    shape_and: { fg: $theme_color5 attr: b }
    shape_binary: { fg: $theme_color5 attr: b }
    shape_pipe: { fg: $theme_color5 attr: b }
    shape_range: { fg: $theme_color5 attr: b }
    shape_redirection: { fg: $theme_color6 attr: b }
    shape_signature: { fg: $theme_color3 attr: b }
    shape_string: $theme_color2
    shape_string_interpolation: $theme_color2
    shape_variable: $theme_color3
    shape_vardecl: $theme_color3
}
