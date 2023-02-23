lua << EOF

require("glow").setup(
{
  install_path = "~/.nix-profile/bin", -- default path for installing glow binary
  border = "shadow", -- floating window border config
  style = "dark",
  pager = false,
  width = 80,
  height = 100,
  width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 0.7,
}
)

EOF
