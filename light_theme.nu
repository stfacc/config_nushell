let theme_color0 = "#333333"
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
    separator: $theme_color0
    leading_trailing_space_bg: { attr: n }
    header: { fg: $theme_color1 attr: b }
    row_index: { fg: $theme_color1 attr: b }
    empty: blue
    bool: { fg: $theme_color5 attr: i }
    int: $theme_color5
    float: $theme_color5
    filesize: { fg: $theme_color7 attr: b }
    duration: $theme_color0
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
            "$theme_color0"
        } else {
            "gray"
        }
    }
    range: $theme_color5
    string: $theme_color0
    nothing: green_bold
    binary: $theme_color0
    cellpath: $theme_color0
    record: $theme_color0
    list: $theme_color0
    block: $theme_color0
    hints: $theme_color0
    search_result: { fg: white bg: red }
    shape_block: { fg: $theme_color1 attr: b }
    shape_closure: { fg: $theme_color4 attr: b }
    shape_custom: green_bold
    shape_datetime: $theme_color6
    shape_directory: $theme_color2
    shape_internalcall: { fg: $theme_color1 attr: b }
    shape_keyword: { fg: $theme_color1 attr: b }
    shape_external: $theme_color2
    shape_external_resolved: $theme_color7
    shape_externalarg: $theme_color2
    shape_filepath: $theme_color2
    shape_flag: { fg: $theme_color7 attr: b }
    shape_garbage: { fg: "#ffffff" bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: { fg: $theme_color5 }
    shape_float: { fg: $theme_color5 }
    shape_bool: { fg: $theme_color5 attr: i }
    shape_list: $theme_color1
    shape_table: { fg: $theme_color1 attr: b }
    shape_record: $theme_color1
    shape_literal: green_bold
    shape_match_pattern: green_bold
    shape_matching_brackets: { attr: u }
    shape_nothing: { fg: $theme_color5 attr: i }
    shape_operator: { fg: $theme_color5 attr: b }
    shape_or: { fg: $theme_color5 attr: b }
    shape_and: { fg: $theme_color5 attr: b }
    shape_binary: { fg: $theme_color5 attr: b }
    shape_pipe: { fg: $theme_color1 attr: b }
    shape_range: { fg: $theme_color5 attr: b }
    shape_redirection: { fg: $theme_color6 attr: b }
    shape_signature: { fg: $theme_color3 attr: b }
    shape_string: $theme_color2
    shape_string_interpolation: $theme_color2
    shape_variable: $theme_color3
    shape_vardecl: $theme_color3
}
