{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [

        "$username"
        "$localip"
        "$shlvl"
        "$singularity"
        "$directory"
        "$vcsh"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$package"
        "$c"
        "$elixir"
        "$erlang"
        "$golang"
        "$guix_shell"
        "$haskell"
        "$lua"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$perl"
        "$python"
        "$rust"
        "$scala"
        "$zig"
        "$buf"
        "$nix_shell"
        "$memory_usage"
        "$custom"
        "$sudo"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$status"
        "$os"
        "$shell"
        "$character"

      ];
      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };

}
